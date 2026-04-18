vim.g.mapleader      = " "
vim.g.maplocalleader = " "

---------------------------------------------------------------------------
-- Bootstrap lazy.nvim
---------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

---------------------------------------------------------------------------
-- Core config
---------------------------------------------------------------------------
require("config.options")
require("config.keymaps")
require("config.filetypes")
require("config.lsp")
require("config.theme")

vim.api.nvim_create_autocmd("VimEnter", {
  once     = true,
  callback = function() require("config.dashboard").open() end,
})
