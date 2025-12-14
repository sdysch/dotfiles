-- Disable compatibility
vim.opt.compatible = false

-- auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath('data')
local plug_path = data_dir .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
	vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

-- load plugins 
vim.call('plug#begin')
-- Plug('preservim/nerdtree')
Plug('tpope/vim-fugitive')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('preservim/nerdcommenter')
--Plug('ctrlpvim/ctrlp.vim')
Plug('ibhagwan/fzf-lua')
-- Plug('gerw/vim-tex-syntax')
Plug('lervag/vimtex')
Plug('junegunn/goyo.vim')
Plug('vimwiki/vimwiki')
Plug('ap/vim-css-color')
Plug('junegunn/vim-peekaboo')
Plug('github/copilot.vim')
Plug('gbprod/nord.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('romgrk/barbar.nvim')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('wellle/context.vim')
Plug('Vigemus/iron.nvim')
Plug('folke/which-key.nvim')

vim.call('plug#end')

-- Colourscheme and syntax
vim.cmd('colorscheme nord')
vim.cmd('syntax on')

-- settings
require('config.settings')
require('config.keymaps')
require('config.autocmds')

-- plugins
require('plugins.nerdtree')
require('plugins.airline')
require('plugins.goyo')
require('plugins.vimwiki')
require('plugins.ctrlp')
require('plugins.indent')
require('plugins.iron')
require('plugins.fzf-lua')
