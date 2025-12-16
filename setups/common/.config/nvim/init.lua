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
-- Plug('preservim/nerdtree') --tree file explorer
Plug('tpope/vim-fugitive') --git integration
-- Plug('vim-airline/vim-airline') --status bar
-- Plug('vim-airline/vim-airline-themes') --airline themes
Plug('nvim-lualine/lualine.nvim') --status bar
Plug('preservim/nerdcommenter') --commenting
--Plug('ctrlpvim/ctrlp.vim') --fuzzy file finder
Plug('ibhagwan/fzf-lua') --fuzzy file finder
-- Plug('gerw/vim-tex-syntax') --latex syntax
Plug('lervag/vimtex') --latex suite
Plug('junegunn/goyo.vim') --distraction free writing
Plug('vimwiki/vimwiki') --personal wiki
Plug('ap/vim-css-color') --css color preview
Plug('junegunn/vim-peekaboo') --enhanced register viewing
Plug('github/copilot.vim') --github copilot
Plug('gbprod/nord.nvim') --nord colorscheme
Plug('nvim-tree/nvim-web-devicons') --file icons
Plug('romgrk/barbar.nvim') --tabline
Plug('lukas-reineke/indent-blankline.nvim') --indentation guides
Plug('wellle/context.vim') --context awareness, shows function/class name at top
Plug('Vigemus/iron.nvim') --interactive REPLs, better way of jupyter-like notebooks with a focus on reproducability
Plug('folke/which-key.nvim') --keybinding popup
Plug('nvim-treesitter/nvim-treesitter') --better syntax highlighting
Plug('nvim-tree/nvim-tree.lua') --file explorer
Plug('numToStr/FTerm.nvim') --floating terminal
Plug('emmanueltouzery/decisive.nvim') --view csv files

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
require('plugins.nvim-treesitter')
require('plugins.nvim-tree')
require('plugins.lualine')
