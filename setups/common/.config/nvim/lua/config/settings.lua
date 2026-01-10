-- ===============================
-- General Settings
-- ===============================
vim.opt.encoding = 'utf-8'
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.errorbells = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.splitright = true
vim.opt.undolevels = 1000
vim.opt.backspace = {'eol','start','indent'}
vim.opt.whichwrap:append('<,>,h,l')
vim.opt.modeline = true
vim.opt.modelines = 5
vim.opt.wildignore = {'*.o','*.pyc','*/tmp/*','*.so','*.swp','*.zip'}
vim.env.TMPDIR = vim.fn.expand('~/.cache/nvim/tmp')

vim.opt.grepprg = 'rg --vimgrep --smart-case --hidden'
vim.opt.grepformat = '%f:%l:%c:%m'

vim.api.nvim_create_user_command('Term', 'terminal', {})
vim.api.nvim_create_user_command('Vterm', 'vertical terminal', {})

-- goyo
vim.g.goyo_width = 250

-- Activate Goyo for git commits
vim.api.nvim_create_autocmd({'BufRead','BufNewFile'}, {
  pattern = '*COMMIT_EDITMSG',
  callback = function()
    vim.g.goyo_width = 120
    vim.cmd('Goyo')
  end,
})

-- vimwiki
vim.g.vimwiki_list = {{ path = os.getenv('VIMWIKI') }}
vim.g.wiki_root = os.getenv('VIMWIKI')

function WikiTodo()
  local path = vim.fn.fnameescape(vim.g.wiki_root .. '/todo.wiki')
  vim.cmd('e ' .. path)
end

function WikiNotes()
  local path = vim.fn.fnameescape(vim.g.wiki_root .. '/notes.wiki')
  vim.cmd('e ' .. path)
end

-- treesitter
require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

-- parsers
require'nvim-treesitter'.install {
	"gitcommit", "gitignore", "html", "http", "json", "json5", "jsonc",
	"lua", "make", "markdown", "markdown_inline", "python", "regex", "rst",
	"scss", "sql", "ssh_config", "toml", "vim", "vimdoc", "yaml"
}

-- highlights
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

-- folds
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
vim.cmd('set nofoldenable') -- start with all folds open
vim.opt.foldlevel = 99
