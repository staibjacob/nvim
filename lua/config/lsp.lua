
-- lua/config/lsp.lua
-- Non-plugin LSP setup: custom server registration + filetype guards.

---------------------------------------------------------------------------
-- SAPF LSP
---------------------------------------------------------------------------
local lspconfig = require("lspconfig")
local configs   = require("lspconfig.configs")

if not configs.sapf then
  configs.sapf = {
    default_config = {
      cmd       = { "/Users/jacobstaib-jensen/.config/sapf-lsp/target/release/sapf-lsp" },
      filetypes = { "sapf" },
      root_dir  = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
            or lspconfig.util.path.dirname(fname)
      end,
    },
  }
end

lspconfig.sapf.setup({})

---------------------------------------------------------------------------
-- HASKELL LANGUAGE SERVER — disable on .tidal files
---------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name ~= "hls" then return end
    local filename = vim.api.nvim_buf_get_name(args.buf)
    if filename:match("%.tidal$") then client.stop() end
  end,
})
