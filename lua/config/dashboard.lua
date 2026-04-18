
-- lua/config/dashboard.lua
-- Animated star-field / sigil sky.  Pure Lua, no extra plugins.

local M = {}

local ns = vim.api.nvim_create_namespace("stellar_dash")

---------------------------------------------------------------------------
-- Highlights
---------------------------------------------------------------------------
local function set_hl()
  vim.api.nvim_set_hl(0, "StellarDim",      { fg = "#2A2724" })
  vim.api.nvim_set_hl(0, "StellarFaint",    { fg = "#3D3B36" })
  vim.api.nvim_set_hl(0, "StellarGray",     { fg = "#727169" })
  vim.api.nvim_set_hl(0, "StellarWhite",    { fg = "#9E9B93" })
  vim.api.nvim_set_hl(0, "StellarBlue",     { fg = "#7FB4CA" })
  vim.api.nvim_set_hl(0, "StellarPink",     { fg = "#D27E99" })
  vim.api.nvim_set_hl(0, "StellarYellow",   { fg = "#E6C384" })
  vim.api.nvim_set_hl(0, "StellarTeal",     { fg = "#7AA89F" })
  vim.api.nvim_set_hl(0, "StellarPurple",   { fg = "#9D79D0" })
  -- Blob layers (core → edge)
  vim.api.nvim_set_hl(0, "StellarBlobCore", { fg = "#E6C384", bold = true })
  vim.api.nvim_set_hl(0, "StellarBlobMid",  { fg = "#D27E99" })
  vim.api.nvim_set_hl(0, "StellarBlobOuter",{ fg = "#7AA89F" })
  vim.api.nvim_set_hl(0, "StellarBlobEdge", { fg = "#3D3B36" })
end

---------------------------------------------------------------------------
-- Character pools  { c = char, b = byte-length in UTF-8 }
---------------------------------------------------------------------------
local TINY  = { {c=".", b=1}, {c="'", b=1}, {c="`", b=1}, {c=",", b=1} }
local SMALL = { {c="*", b=1}, {c="+", b=1}, {c="x", b=1} }
local MED   = { {c="◇",b=3}, {c="○",b=3}, {c="△",b=3}, {c="◦",b=3}, {c="⋆",b=3} }
local SYM   = { {c="◈",b=3}, {c="✦",b=3}, {c="⊹",b=3}, {c="⌖",b=3} }
local FRAG  = {
  {c="/", b=1}, {c="\\",b=1}, {c="-",b=1}, {c="|",b=1},
  {c="╱",b=3}, {c="╲",b=3}, {c="─",b=3}, {c="│",b=3},
  {c="┼",b=3}, {c="╌",b=3},
}

---------------------------------------------------------------------------
-- Object factory
---------------------------------------------------------------------------
local function make_objects(w, h)
  math.randomseed(os.time())

  local bright = { "StellarBlue","StellarPink","StellarYellow","StellarTeal","StellarPurple" }
  local dim    = { "StellarDim","StellarFaint","StellarGray","StellarWhite" }

  local objs = {}

  local function add(n, pool, hls, speed_base, twinkle_range)
    for _ = 1, n do
      local angle = math.random() * math.pi * 2
      local spd   = speed_base * (0.4 + math.random() * 1.2)
      local ch    = pool[math.random(#pool)]
      local tk    = twinkle_range > 0 and math.random(twinkle_range) or 0
      table.insert(objs, {
        x  = math.random() * w,
        y  = math.random() * h,
        vx = math.cos(angle) * spd,
        vy = math.sin(angle) * spd * 0.3,
        ch = ch.c, cb = ch.b,
        hl       = hls[math.random(#hls)],
        hl_pool  = hls,
        ch_pool  = pool,
        tk       = tk,
        tk_max   = tk,
      })
    end
  end

  add(170, TINY,  dim,    0.022, 55)
  add(65,  SMALL, dim,    0.045, 25)
  add(28,  MED,   bright, 0.035,  0)
  add(14,  SYM,   bright, 0.025,  0)
  add(20,  FRAG,  dim,    0.030,  0)

  return objs
end

---------------------------------------------------------------------------
-- Per-frame update
---------------------------------------------------------------------------
local function tick(objs, w, h)
  for _, o in ipairs(objs) do
    o.x = o.x + o.vx
    o.y = o.y + o.vy
    if o.x >= w then o.x = o.x - w elseif o.x < 0 then o.x = o.x + w end
    if o.y >= h then o.y = o.y - h elseif o.y < 0 then o.y = o.y + h end

    -- Twinkle: swap char + occasionally flare brighter
    if o.tk_max > 0 then
      o.tk = o.tk - 1
      if o.tk <= 0 then
        o.tk = o.tk_max
        local ch = o.ch_pool[math.random(#o.ch_pool)]
        o.ch = ch.c
        o.cb = ch.b
        o.hl = math.random() < 0.12
          and "StellarWhite"
          or  o.hl_pool[math.random(#o.hl_pool)]
      end
    end
  end
end

---------------------------------------------------------------------------
-- Pulsating blob
-- Returns overlay: [row][col] = { ch, cb, hl }
---------------------------------------------------------------------------
local function compute_blob(w, h, t)
  local cx = w / 2
  local cy = h / 2

  -- Base radius in columns; aspect ratio correction (~0.45 since chars are ~2× taller)
  local base_r  = 9.0
  local pulse   = math.sin(t * 0.08) * 1.8          -- slow main pulse
  local pulse2  = math.sin(t * 0.13 + 1.0) * 0.7    -- secondary wobble

  local overlay = {}

  -- Scan a bounding box around the center
  local scan_r = math.ceil(base_r + math.abs(pulse) + math.abs(pulse2) + 4)
  for dy = -scan_r, scan_r do
    local row = math.floor(cy + dy)
    if row >= 0 and row < h then
      for dx = -scan_r * 2, scan_r * 2 do
        local col = math.floor(cx + dx)
        if col >= 0 and col < w then
          -- Normalise to unit circle (correct for terminal aspect)
          local nx = dx / (base_r * 2.2)
          local ny = dy / (base_r * 1.0)

          -- Organic boundary: sum of sinusoids at different frequencies
          local angle = math.atan(ny, nx)
          local rim = 1.0
            + 0.18 * math.sin(angle * 3 + t * 0.05)
            + 0.12 * math.sin(angle * 5 - t * 0.07)
            + 0.08 * math.sin(angle * 7 + t * 0.03)
            + 0.06 * math.sin(angle * 2 - t * 0.04)

          -- Effective radius with pulse applied
          local r_eff = (base_r + pulse + pulse2) * rim
          -- Normalised distance (0 = center, 1 = edge of blob)
          local dist_cols = math.sqrt((dx / 2.2) ^ 2 + dy ^ 2)
          local norm = dist_cols / r_eff

          if norm <= 1.0 then
            local ch, cb, hl

            -- Noise gate for organic density (skip a fraction of cells per zone)
            local noise = math.sin(col * 127.1 + row * 311.7 + t * 0.3) * 0.5 + 0.5

            if norm < 0.22 then
              -- Core: dense, gold, bold symbols
              ch, cb, hl = "◆", 3, "StellarBlobCore"
            elseif norm < 0.50 then
              if noise > 0.20 then
                ch, cb, hl = "◈", 3, "StellarBlobMid"
              else
                ch, cb, hl = "·", 2, "StellarBlobMid"
              end
            elseif norm < 0.78 then
              if noise > 0.35 then
                ch, cb, hl = "◦", 3, "StellarBlobOuter"
              else
                ch, cb, hl = "·", 2, "StellarBlobOuter"
              end
            else
              -- Thin edge: sparse dots
              if noise > 0.55 then
                ch, cb, hl = "·", 2, "StellarBlobEdge"
              end
            end

            if ch then
              if not overlay[row] then overlay[row] = {} end
              overlay[row][col] = { ch = ch, cb = cb, hl = hl }
            end
          end
        end
      end
    end
  end

  return overlay
end

---------------------------------------------------------------------------
-- Render into buffer
-- Builds each line left-to-right, tracking byte offset for extmarks.
-- overlay[row][col] cells take priority over star objects.
---------------------------------------------------------------------------
local function render(buf, objs, w, h, overlay)
  -- Bucket objects by integer row
  local rows = {}
  for y = 0, h - 1 do rows[y] = {} end

  for _, o in ipairs(objs) do
    local col = math.floor(o.x)
    local row = math.floor(o.y)
    if col >= 0 and col < w and row >= 0 and row < h then
      table.insert(rows[row], { col = col, ch = o.ch, cb = o.cb, hl = o.hl })
    end
  end

  for y = 0, h - 1 do
    table.sort(rows[y], function(a, b) return a.col < b.col end)
  end

  local lines     = {}
  local all_marks = {}

  for y = 0, h - 1 do
    local parts    = {}
    local marks    = {}
    local cur_col  = 0
    local byte_off = 0

    -- Merge stars + blob overlay into a single sorted column list
    -- Build merged cell list for this row
    local cells = {}

    -- Stars
    for _, obj in ipairs(rows[y]) do
      -- Skip cells occupied by blob
      if not (overlay[y] and overlay[y][obj.col]) then
        cells[obj.col] = { ch = obj.ch, cb = obj.cb, hl = obj.hl }
      end
    end

    -- Blob overlay (overwrites stars)
    if overlay[y] then
      for col, cell in pairs(overlay[y]) do
        cells[col] = cell
      end
    end

    -- Collect and sort
    local sorted = {}
    for col, cell in pairs(cells) do
      table.insert(sorted, { col = col, ch = cell.ch, cb = cell.cb, hl = cell.hl })
    end
    table.sort(sorted, function(a, b) return a.col < b.col end)

    for _, obj in ipairs(sorted) do
      if obj.col >= cur_col then
        local spaces = obj.col - cur_col
        if spaces > 0 then
          table.insert(parts, string.rep(" ", spaces))
          byte_off = byte_off + spaces
        end
        table.insert(parts, obj.ch)
        table.insert(marks, { y, byte_off, byte_off + obj.cb, obj.hl })
        byte_off = byte_off + obj.cb
        cur_col  = obj.col + 1
      end
    end

    local remaining = w - cur_col
    if remaining > 0 then
      table.insert(parts, string.rep(" ", remaining))
    end

    lines[y + 1] = table.concat(parts)
    for _, m in ipairs(marks) do table.insert(all_marks, m) end
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
  for _, m in ipairs(all_marks) do
    pcall(vim.api.nvim_buf_set_extmark, buf, ns, m[1], m[2], {
      end_col  = m[3],
      hl_group = m[4],
    })
  end
end

---------------------------------------------------------------------------
-- Lifecycle
---------------------------------------------------------------------------
local state = {}

local function close()
  if state.closed then return end  -- guard against double-calls
  state.closed = true

  if state.timer then
    local t = state.timer
    state.timer = nil
    pcall(function() t:stop() end)
    pcall(function() t:close() end)
  end

  if state.on_key_ns then
    local ok_ns = state.on_key_ns
    state.on_key_ns = nil
    pcall(vim.on_key, nil, ok_ns)
  end

  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.wo[state.win].number         = true
    vim.wo[state.win].relativenumber = true
    vim.wo[state.win].cursorline     = true
    vim.wo[state.win].signcolumn     = "yes"
  end

  state.buf = nil
  state.win = nil
  vim.cmd("enew")
end

function M.open()
  -- Skip when nvim was launched with file arguments
  if vim.fn.argc() > 0 then return end

  local w = vim.o.columns
  local h = vim.o.lines - vim.o.cmdheight - 1

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value("buftype",    "nofile", { buf = buf })
  vim.api.nvim_set_option_value("bufhidden",  "wipe",   { buf = buf })
  vim.api.nvim_set_option_value("modifiable", true,     { buf = buf })
  vim.api.nvim_set_option_value("swapfile",   false,    { buf = buf })

  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, buf)

  -- Minimal window chrome
  vim.wo[win].number         = false
  vim.wo[win].relativenumber = false
  vim.wo[win].cursorline     = false
  vim.wo[win].signcolumn     = "no"
  vim.wo[win].colorcolumn    = ""

  state.buf    = buf
  state.win    = win
  state.closed = false

  set_hl()
  vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })

  local objs   = make_objects(w, h)
  local blob_t = math.random(0, 100)

  -- First frame
  local overlay = compute_blob(w, h, blob_t)
  render(buf, objs, w, h, overlay)
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

  -- Animation loop
  local timer = vim.loop.new_timer()
  state.timer = timer

  timer:start(0, 110, vim.schedule_wrap(function()
    if state.closed or not (state.buf and vim.api.nvim_buf_is_valid(state.buf)) then
      pcall(function() timer:stop() end)
      pcall(function() timer:close() end)
      return
    end
    blob_t = blob_t + 1
    local ov = compute_blob(w, h, blob_t)
    vim.api.nvim_set_option_value("modifiable", true,  { buf = state.buf })
    tick(objs, w, h)
    render(buf, objs, w, h, ov)
    vim.api.nvim_set_option_value("modifiable", false, { buf = state.buf })
  end))

  -- Delay key-handler registration so startup Enter presses don't immediately
  -- dismiss the dashboard (e.g. LSP notices, lazy update messages, etc.)
  vim.defer_fn(function()
    if state.closed then return end
    local ok_ns = vim.api.nvim_create_namespace("stellar_dismiss")
    state.on_key_ns = ok_ns
    vim.on_key(function(key)
      if state.closed then vim.on_key(nil, ok_ns); return end
      if not (state.buf and vim.api.nvim_buf_is_valid(state.buf)) then
        vim.on_key(nil, ok_ns); return
      end
      if vim.api.nvim_get_current_buf() ~= state.buf then return end
      if key == "" then return end
      vim.schedule(close)
    end, ok_ns)
  end, 400)

  -- Stop the timer if the buffer is abandoned via any other route
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer   = buf,
    once     = true,
    callback = function() vim.schedule(close) end,
  })

end

return M
