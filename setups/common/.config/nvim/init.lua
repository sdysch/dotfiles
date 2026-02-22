-- disable compatibility
vim.opt.compatible = false

-- leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup("plugins", {
  defaults = {
    lazy = true,
  },
  install = {
    -- colorscheme = { 'nord' },
  },
})

-- colourscheme and syntax
-- vim.cmd('colorscheme nord')
-- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd("colorscheme catppuccin-frappe")
vim.cmd("syntax on")

-- settings
require("config.settings")
require("config.keymaps")
require("config.autocmds")
