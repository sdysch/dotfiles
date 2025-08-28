set nocompatible
filetype off

" Install vim-plug if not already installed
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gerw/vim-tex-syntax'
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'junegunn/vim-peekaboo'
Plug 'github/copilot.vim'
Plug 'gbprod/nord.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin on

" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let g:NERDTreeDirArrows=0

" Airline
let g:airline_theme="base16_nord"
let g:airline_extensions = []
let g:airline_section_x = '%{strftime("%H:%M %a %d/%m/%y")}'
let g:airline_section_y = ''

" Goyo
let g:goyo_width = 250

" Enable Goyo (distraction free mode) if git prompts for a commit message
" (git commit called without -m flag)"
autocmd BufRead,BufNewFile *COMMIT_EDITMSG let g:goyo_width=80
autocmd BufRead,BufNewFile *COMMIT_EDITMSG :Goyo

" wildignores
set wildignore=*.o,*.pyc
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

set encoding=utf-8

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ','

" Fast saving and quitting
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>qa :qa<cr>

" fugitive shortcuts
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>

" compiling LaTeX documents (with Makefile)
nmap <leader>r :!make<cr>

" turn off search highlighting
nmap <leader>n :noh<cr>

" easier yanking/pasting to/from system clipboard
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>Y "*y
noremap <leader>P "*p

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" colour scheme and syntax
" colorscheme slate
colorscheme nord
syntax on

" indentation
set autoindent
set copyindent
set cursorline
set hlsearch
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab

" searching
set ignorecase
set smartcase
set incsearch

" error bells off
set noerrorbells

" no backups
set nobackup
set nowb
set noswapfile

set nowrap

" turn relative line numbers on
set relativenumber
set rnu
set number


" show matching brackets
set showmatch

" smarter splitting
set splitright
"set splitbelow

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

nnoremap <leader>- :split<CR>
nnoremap <leader>\| :vsplit<CR>

" Navigate tabs with shift-{h,l}
noremap <S-l> gt
noremap <S-h> gT

set undolevels=1000

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" modeline
set modeline
set modelines=5

" mac specific (?) to run bashrc when vim is shut
"set shell=bash\ --login

" open terminals
:command Term  terminal
:command Vterm vertical terminal

" Stop accidentally opening command window and ex mode
map q: :q
map Q :q

" === autocmds ===

" open vim at previous line
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g'\"" | endif
endif

" text wrapping for LaTeX files
autocmd FileType tex set tw=100

" rerun compton when saving its config file
autocmd BufWritePost *compton.conf !killall picom && picom -b --config ~/.config/compton/compton.conf &

" rerun dunst when saving its config file
autocmd BufWritePost *dunstrc !restart_dunst

" rerun waybar when saving its config file
autocmd BufWritePost *waybar/*, !restart_waybar

" Run xrdb whenever Xdefaults or Xresources are updated
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Fix tex file type set
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Automatically backup vim wiki when saving
" Uses 'backup_vimwiki' command
autocmd BufWritePost *.wiki if executable('backup_vimwiki') | !backup_vimwiki

" === vimwiki configuration ===
" vimwiki
let g:vimwiki_list = [{"path" : "$VIMWIKI"}]
let g:wiki_root    = "$VIMWIKI"

" Open the work todo file of the wiki
function WikiTodo()
  let path = fnameescape(expand(g:wiki_root)) . '/todo.wiki'
  execute 'e ' . path
endfunction

" Open the work todo file of the wiki
function WikiNotes()
  let path = fnameescape(expand(g:wiki_root)) . '/notes.wiki'
  execute 'e ' . path
endfunction

nmap <Leader>wt :call WikiTodo() <cr>
nmap <Leader>wn :call WikiNotes() <cr>

" === ctrlp configuration ===
" ctrlp ignore directories
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" open new file in vertical split
let g:ctrlp_open_new_file = 'v'

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("h")': ['<c-v>', '<2-LeftMouse>', '<Enter>'],
    \ 'AcceptSelection("v")': ['<cr>', '<RightMouse>'],
    \ }

lua << EOF
require('ibl').setup()
EOF

