return {

  ---------------------------------------------------------------------------
  -- SUPERCOLLIDER (scnvim)
  ---------------------------------------------------------------------------
  {
    "davidgranstrom/scnvim",
    config = function()
      local scnvim   = require("scnvim")
      local map      = scnvim.map
      local map_expr = scnvim.map_expr

      -- Load scnvim snippets into LuaSnip
      local ok, snips = pcall(require("scnvim.utils").get_snippets)
      if ok and snips then
        require("luasnip").add_snippets("supercollider", snips)
      end

      -------------------------------------------------------------------------
      -- Signature box (top-right, depth-aware)
      -------------------------------------------------------------------------
      local _sig_winid = nil
      local _sig_bufnr = nil
      local _sig_ns    = vim.api.nvim_create_namespace("scnvim_sig")

      local function close_sig_win()
        if _sig_winid and vim.api.nvim_win_is_valid(_sig_winid) then
          pcall(vim.api.nvim_win_close, _sig_winid, false)
          _sig_winid = nil
        end
      end

      local function show_sig_topright(name, args)
        vim.api.nvim_set_hl(0, "SCNvimSigName", { fg = "#C34043", bold = true })
        vim.api.nvim_set_hl(0, "SCNvimSigArg",  { fg = "#C0A36E" })

        if not _sig_bufnr or not vim.api.nvim_buf_is_valid(_sig_bufnr) then
          _sig_bufnr = vim.api.nvim_create_buf(false, true)
        end

        local lines = { " " .. name }
        for _, arg in ipairs(args) do lines[#lines + 1] = " " .. arg end

        vim.api.nvim_buf_set_lines(_sig_bufnr, 0, -1, false, lines)
        vim.api.nvim_buf_clear_namespace(_sig_bufnr, _sig_ns, 0, -1)
        vim.api.nvim_buf_set_extmark(_sig_bufnr, _sig_ns, 0, 0, {
          end_row = 0, end_col = #lines[1],
          hl_group = "SCNvimSigName", priority = 500,
        })
        for i = 1, #args do
          vim.api.nvim_buf_set_extmark(_sig_bufnr, _sig_ns, i, 0, {
            end_row = i, end_col = #lines[i + 1],
            hl_group = "SCNvimSigArg", priority = 500,
          })
        end

        local width = 0
        for _, l in ipairs(lines) do width = math.max(width, #l + 1) end
        width = math.min(width, vim.o.columns - 4)
        local col = vim.o.columns - width - 2

        if _sig_winid and vim.api.nvim_win_is_valid(_sig_winid) then
          vim.api.nvim_win_set_config(_sig_winid, {
            relative = "editor", row = 1, col = col,
            width = width, height = #lines,
          })
        else
          _sig_winid = vim.api.nvim_open_win(_sig_bufnr, false, {
            relative  = "editor", row = 1, col = col,
            width = width, height = #lines,
            style = "minimal", border = "rounded",
            focusable = false, zindex = 45,
          })
        end
      end

      local function show_object_sig(object)
        local sclang = require("scnvim.sclang")
        sclang.eval(string.format('SCNvim.methodArgs("%s")', object), function(res)
          local sig = res:match("%((.+)%)")
          if sig then
            local args = vim.split(sig, ", ", { plain = true })
            vim.schedule(function() show_sig_topright(object, args) end)
          end
        end)
      end

      local function find_enclosing_object(line, col)
        local before = line:sub(1, col)
        local depth, paren_at_depth = 0, {}
        for i = 1, #before do
          local c = before:sub(i, i)
          if     c == "(" then depth = depth + 1; paren_at_depth[depth] = i
          elseif c == ")" then paren_at_depth[depth] = nil; depth = math.max(0, depth - 1)
          end
        end
        if depth <= 0 or not paren_at_depth[depth] then return nil end
        local before_paren = before:sub(1, paren_at_depth[depth] - 1)
        return before_paren:match("([%u][%w]*%.[%w]+)%s*$")
            or before_paren:match("([%u][%w]*)%s*$")
      end

      vim.api.nvim_create_autocmd({ "TextChangedI", "CursorMovedI" }, {
        pattern  = { "*.sc", "*.scd" },
        callback = function()
          local cursor = vim.api.nvim_win_get_cursor(0)
          local obj = find_enclosing_object(vim.api.nvim_get_current_line(), cursor[2])
          if obj then show_object_sig(obj)
          else require("scnvim.signature").show() end
        end,
      })

      vim.api.nvim_create_autocmd("InsertLeave", {
        pattern  = { "*.sc", "*.scd" },
        callback = function()
          close_sig_win()
          require("scnvim.signature").close()
        end,
      })

      -------------------------------------------------------------------------
      -- Setup
      -------------------------------------------------------------------------
      scnvim.setup({
        keymaps = {
          ["<leader>op"]  = map("editor.send_line",      { "i", "n" }),
          ["<leader><CR>"]= map("editor.send_block",     { "i", "n" }),
          ["x|<C-e>"]     = map("editor.send_selection"),
          ["<CR>"]        = map("postwin.toggle"),
          ["<M-CR>"]      = map("postwin.toggle", "i"),
          ["<M-L>"]       = map("postwin.clear",  { "n", "i" }),
          ["<C-k>"]       = map("signature.show", { "n", "i" }),
          ["<leader>ss"]  = map("sclang.hard_stop", { "n", "x", "i" }),
          ["<leader>st"]  = map("sclang.start"),
          ["<leader>sq"]  = map("sclang.stop"),
          ["<leader>sk"]  = map("sclang.recompile"),
          ["<F1>"]        = map_expr("s.boot"),
          ["<F2>"]        = map_expr("s.meter"),
        },
        postwin = {
          float       = { enabled = false },
          direction   = "right",
          size        = 50,
          auto_scroll = true,
        },
        editor = {
          signature = { float = false, auto = false },
        },
      })

      -- Mirror post window output to a file so you can tail -f it
      -- on a second monitor: tail -f ~/.local/share/nvim/scnvim-post.log
      local postwin     = require('scnvim.postwin')
      local _orig_post  = postwin.post
      local _log_path   = vim.fn.stdpath('data') .. '/scnvim-post.log'
      local _log_fh     = io.open(_log_path, 'a')
      postwin.post = function(line)
        _orig_post(line)
        if _log_fh then
          _log_fh:write(line .. '\n')
          _log_fh:flush()
        end
      end
    end,
  },

  ---------------------------------------------------------------------------
  -- TIDAL CYCLES
  ---------------------------------------------------------------------------
  {
    "grddavies/tidal.nvim",
    opts = {
      boot = {
        tidal = {
          cmd     = "ghci",
          args    = { "-v0" },
          file    = os.getenv("HOME") .. "/.config/tidal/BootTidal.hs",
          enabled = true,
        },
        split = "v",
      },
      mappings = {
        send_line    = { mode = { "i", "n" },       key = "<leader>kl" },
        send_visual  = { mode = { "x" },             key = "<leader>kl" },
        send_block   = { mode = { "i", "n", "x" },  key = "<leader><lk>" },
        send_node    = { mode = "n",                 key = "<leader><C-n>" },
        send_silence = { mode = "n",                 key = "<leader>d" },
        send_hush    = { mode = "n",                 key = "<leader><Esc>" },
      },
      selection_highlight = {
        highlight = { link = "IncSearch" },
        timeout   = 150,
      },
    },
    config = function(_, opts) require("tidal").setup(opts) end,
  },

  ---------------------------------------------------------------------------
  -- SAPF
  ---------------------------------------------------------------------------
  {
    "vasilymilovidov/sapf.nvim",
    config = function()
      require("sapf").setup({
        interpreter = "/Users/jacobstaib-jensen/sapf-files/sapf",
        debug       = false,
        window      = { width = 0.4, position = "right" },
        buffer      = { syntax_highlighting = true },
      })
    end,
    keys = {
      { "<leader>on", "<cmd>SapfStart<cr>",        desc = "Start Sapf" },
      { "<leader>ok", "<cmd>SapfKill<cr>",         desc = "Kill Sapf" },
      { "<leader>os", "<cmd>SapfStop<cr>",         desc = "Send Stop" },
      { "<leader>oc", "<cmd>SapfClear<cr>",        desc = "Send Clear" },
      { "<leader>oe", "<cmd>SapfEvalParagraph<cr>",desc = "Eval Paragraph" },
      { "<leader>om", "<cmd>SapfRunMultiple<cr>",  desc = "Run Multiple" },
      { "<leader>or", "<cmd>SapfStopAndEval<cr>",  desc = "Stop & Reeval" },
      { "<leader>oh", "<cmd>SapfFunctionHelp<cr>", desc = "Function Help" },
    },
  },

  ---------------------------------------------------------------------------
  -- STRUDEL
  ---------------------------------------------------------------------------
  {
    "gruvw/strudel.nvim",
    config = function()
      require("strudel").setup({
        ui = {
          maximise_menu_panel = true,
          hide_menu_panel     = true,
          hide_top_bar        = true,
        },
        browser_exec_path = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser",
        headless          = false,
      })

      local s = require("strudel")
      vim.keymap.set("n", "<leader>sl", s.launch,     { desc = "Launch Strudel" })
      vim.keymap.set("n", "<leader>sq", s.quit,       { desc = "Quit Strudel" })
      vim.keymap.set("n", "<leader>st", s.toggle,     { desc = "Toggle Play/Stop" })
      vim.keymap.set("n", "<leader>su", s.update,     { desc = "Update" })
      vim.keymap.set("n", "<leader>ss", s.stop,       { desc = "Stop Playback" })
      vim.keymap.set("n", "<leader>sb", s.set_buffer, { desc = "Set Buffer" })
      vim.keymap.set("n", "<leader>sc", s.execute,    { desc = "Set Buffer & Update" })
    end,
  },

  ---------------------------------------------------------------------------
  -- CLOJURE / OVERTONE (Conjure)
  ---------------------------------------------------------------------------
  {
    "Olical/conjure",
    ft = { "clojure" },
    config = function()
      vim.g["conjure#log#wrap"]                        = true
      vim.g["conjure#log#hud#enabled"]                 = true
      vim.g["conjure#extract#tree_sitter#enabled"]     = true
      vim.g["conjure#client#clojure#nrepl#auto_start"] = false
      vim.g["conjure#client#clojure#nrepl#auto_connect"]= false
    end,
  },

}
