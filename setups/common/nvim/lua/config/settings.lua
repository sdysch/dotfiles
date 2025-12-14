-- ===============================
-- General Settings
-- ===============================
vim.opt.encoding = 'utf-8'
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.hlsearch = false
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
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

-- Leader keys
vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.api.nvim_create_user_command('Term', 'terminal', {})
vim.api.nvim_create_user_command('Vterm', 'vertical terminal', {})
