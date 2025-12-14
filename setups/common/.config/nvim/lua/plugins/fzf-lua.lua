local fzf = require('fzf-lua')

vim.keymap.set('n', '<c-p>', fzf.git_files)
vim.keymap.set('n', '<c-b>', fzf.buffers)
vim.keymap.set('n', '<c-f>', fzf.live_grep)
vim.keymap.set('n', '<leader>*', fzf.grep_cword)
vim.keymap.set('n', '<leader>fr', fzf.oldfiles)
