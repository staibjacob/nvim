-- ~/.config/nvim/init.lua

-- Bootstrap lazy.nvim if it's not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



-- Load all plugins from plugins-setup.lua
require("plugins.plugins-setup")
require("config.colorscheme")
require("config.options")
require("config.keymaps")
require("plugins.nvimtree")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.tree-sitter")
require("plugins.scnvim")
