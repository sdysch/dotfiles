local map = vim.keymap.set

-- File management
map('n', '<leader>w', ':w!<CR>', { noremap=true, silent=true })
map('n', '<leader>q', ':q<CR>', { noremap=true, silent=true })
map('n', '<leader>qa', ':qa<CR>', { noremap=true, silent=true })

-- Fugitive
map('n', '<leader>gs', ':Gstatus<CR>', { noremap=true, silent=true })
map('n', '<leader>gc', ':Gcommit<CR>', { noremap=true, silent=true })

-- Make
map('n', '<leader>r', ':!make<CR>', { noremap=true, silent=true })

-- Search
map('n', '<leader>n', ':noh<CR>', { noremap=true, silent=true })

-- Clipboard
map({'n','v'}, '<leader>y', '"+y', { noremap=true, silent=true })
map({'n','v'}, '<leader>p', '"+p', { noremap=true, silent=true })
map({'n','v'}, '<leader>Y', '"*y', { noremap=true, silent=true })
map({'n','v'}, '<leader>P', '"*p', { noremap=true, silent=true })

-- Split navigation
map('n', '<C-h>', '<C-w>h', { noremap=true })
map('n', '<C-j>', '<C-w>j', { noremap=true })
map('n', '<C-k>', '<C-w>k', { noremap=true })
map('n', '<C-l>', '<C-w>l', { noremap=true })
map('n', '<C-Left>', ':vertical resize +3<CR>', { noremap=true, silent=true })
map('n', '<C-Right>', ':vertical resize -3<CR>', { noremap=true, silent=true })
map('n', '<C-Up>', ':resize +3<CR>', { noremap=true, silent=true })
map('n', '<C-Down>', ':resize -3<CR>', { noremap=true, silent=true })
map('n', '<leader>-', ':split<CR>', { noremap=true })
map('n', '<leader>\\', ':vsplit<CR>', { noremap=true })

-- Tabs
map('n', '<S-l>', 'gt', { noremap=true })
map('n', '<S-h>', 'gT', { noremap=true })

-- Buffers
map('n', '<Leader>b', ':buffers<CR>:buffer ', { noremap=true, silent=true })
map('n', '<Leader>bd', ':bdelete<CR>', { noremap=true, silent=true })
map('n', '<Leader>bn', ':bnext<CR>', { noremap=true, silent=true })
map('n', '<Leader>bp', ':bprevious<CR>', { noremap=true, silent=true })
map('n', '<Leader>bl', ':blast<CR>', { noremap=true, silent=true })
map('n', '<Leader>bf', ':bfirst<CR>', { noremap=true, silent=true })


-- Wiki shortcuts
map('n', '<leader>wt', ':call WikiTodo()<CR>', { noremap=true, silent=true })
map('n', '<leader>wn', ':call WikiNotes()<CR>', { noremap=true, silent=true })

-- Disable accidental command window
map('n', 'q:', ':q<CR>', { noremap=true })
map('n', 'Q', ':q<CR>', { noremap=true })
