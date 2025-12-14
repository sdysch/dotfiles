local map = vim.keymap.set

-- File management
map('n', '<leader>w', ':w!<CR>', { noremap=true, silent=true })
map('n', '<leader>q', ':q<CR>', { noremap=true, silent=true })
map('n', '<leader>qa', ':qa<CR>', { noremap=true, silent=true })

-- Fugitive
map('n', '<leader>gs', ':Git status<CR>', { noremap=true, silent=true })
map('n', '<leader>gc', ':Git commit<CR>', { noremap=true, silent=true })
map('n', '<leader>gd', ':Gdiffsplit<CR>', { noremap=true, silent=true })

-- Make
map('n', '<leader>r', ':!make<CR>', { noremap=true, silent=true })

-- Search
map('n', '<leader>n', ':noh<CR>', { noremap=true, silent=true })

-- file explorer
map('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Clipboard
map({'n','v'}, '<leader>y', '"+y', { noremap=true, silent=true })
map({'n','v'}, '<leader>p', '"+p', { noremap=true, silent=true })
map({'n','v'}, '<leader>Y', '"*y', { noremap=true, silent=true })
map({'n','v'}, '<leader>P', '"*p', { noremap=true, silent=true })

-- Split navigation and resizing
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
map('n', '<leader>=', '<C-w>=', { noremap = true, silent = true })

-- Tabs
map('n', '<S-l>', 'gt', { noremap=true })
map('n', '<S-h>', 'gT', { noremap=true })

-- Buffers
map('n', '<Leader>b', ':buffers<CR>:buffer ', { noremap=true, silent=true })
map('n', '<Leader>bd', ':bdelete<CR>', { noremap=true, silent=true })
map('n', '<Leader>bn', ':bnext<CR>', { noremap=true, silent=true })
map('n', '<Leader>bp', ':bprevious<CR>', { noremap=true, silent=true }) map('n', '<Leader>bl', ':blast<CR>', { noremap=true, silent=true })
map('n', '<Leader>bf', ':bfirst<CR>', { noremap=true, silent=true })


-- Wiki shortcuts
map('n', '<leader>wt', ':call WikiTodo()<CR>', { noremap=true, silent=true })
map('n', '<leader>wn', ':call WikiNotes()<CR>', { noremap=true, silent=true })

-- Disable accidental command window
map('n', 'q:', ':q<CR>', { noremap=true })
map('n', 'Q', ':q<CR>', { noremap=true })

-- FTerm floating terminal
map('n', '<leader>z', ":lua require('FTerm').open()<CR>") --open terminal
map('t', '<Esc>', '<C-\\><C-n><CMD>lua require("FTerm").close()<CR>') --preserves session

-- python breakpoints
local function toggle_breakpoint()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_get_current_line()

  -- check if the line above already has a breakpoint
  local prev_line = vim.api.nvim_buf_get_lines(0, row - 2, row - 1, false)[1] or ''
  if prev_line:match('breakpoint%(') then
    -- remove the breakpoint line above
    vim.api.nvim_buf_set_lines(0, row - 2, row - 1, false, {})
  else
    -- insert breakpoint() above current line, matching current indentation
    local indent = line:match('^%s*') or ''
    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { indent .. 'breakpoint()' })
  end
end

-- map to <leader>b in Python buffers
vim.keymap.set('n', '<leader>b', toggle_breakpoint, { buffer = true, silent = true })
