local map = vim.keymap.set

-- File management
map('n', '<leader>w', ':w!<CR>', { noremap=true, silent=true })
map('n', '<leader>q', ':q<CR>', { noremap=true, silent=true })
map('n', '<leader>qa', ':qa<CR>', { noremap=true, silent=true })

-- Lazy git
vim.keymap.set('n', '<leader>lg', function()
  vim.fn.termopen('lazygit')
  vim.cmd('startinsert')
end, { desc = 'Lazygit (terminal)' })

-- Make
map('n', '<leader>r', ':!make<CR>', { noremap=true, silent=true })

-- Search
map('n', '<leader>n', ':noh<CR>', { noremap=true, silent=true })

-- Clipboard
map({'n','v'}, '<leader>y', '"+y', { noremap=true, silent=true })
map({'n','v'}, '<leader>p', '"+p', { noremap=true, silent=true })
map({'n','v'}, '<leader>Y', '"*y', { noremap=true, silent=true })
map({'n','v'}, '<leader>P', '"*p', { noremap=true, silent=true })

-- Split navigation and resizing
-- These interfere with vim-tmux-navigator now
-- map('n', '<C-h>', '<C-w>h', { noremap=true })
-- map('n', '<C-j>', '<C-w>j', { noremap=true })
-- map('n', '<C-k>', '<C-w>k', { noremap=true })
-- map('n', '<C-l>', '<C-w>l', { noremap=true })

map('n', '<C-Left>', ':vertical resize +3<CR>', { noremap=true, silent=true })
map('n', '<C-Right>', ':vertical resize -3<CR>', { noremap=true, silent=true })
map('n', '<C-Up>', ':resize +3<CR>', { noremap=true, silent=true })
map('n', '<C-Down>', ':resize -3<CR>', { noremap=true, silent=true })
map('n', '<leader>-', ':split<CR>', { noremap=true })
map('n', '<leader>\\', ':vsplit<CR>', { noremap=true })
map('n', '<leader>=', '<C-w>=', { noremap=true, silent=true })
-- map('n', '<leader>sp', ':split ', { noremap=true, silent=false, desc='Split and edit file'})
-- map('n', '<leader>vsp', ':vsplit ', { noremap=true, silent=false, desc='V split and edit file'})


-- Tabs
map('n', '<S-l>', 'gt', { noremap=true })
map('n', '<S-h>', 'gT', { noremap=true })

-- Buffers
map('n', '<Leader>b', ':buffers<CR>:buffer ', { noremap=true, silent=true })
map('n', '<Leader>bd', ':bdelete<CR>', { noremap=true, silent=true })



-- Disable accidental command window
map('n', 'q:', ':q<CR>', { noremap=true })
map('n', 'Q', ':q<CR>', { noremap=true })

-- vim native terminal
map('n', '<leader>vt', ':vertical terminal<CR>', { noremap=true, silent=false, desc='Open vertical split terminal'})

-- === python ===
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
vim.keymap.set('n', '<leader>B', toggle_breakpoint, { buffer = true, silent = true, desc = 'toggle python breakpoint' })

-- === copying files ===
-- copy filename
vim.keymap.set('n', '<leader>cf', function()
  vim.fn.setreg('+', vim.fn.expand('%:t'))
end, { desc = 'Copy filename' })

-- copy filepath
vim.keymap.set('n', '<leader>cp', function()
  vim.fn.setreg('+', vim.fn.expand('%:p'))
end, { desc = 'Copy file path' })

-- copy filepath relative to git repo head
local function copy_git_relative_path()
  local file = vim.fn.expand('%:p')
  if file == '' then
    vim.notify('No file', vim.log.levels.WARN)
    return
  end

  local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 or not git_root then
    vim.notify('Not in a git repo', vim.log.levels.ERROR)
    return
  end

  local rel_path = file:sub(#git_root + 2)
  vim.fn.setreg('+', rel_path)
  vim.notify(rel_path, vim.log.levels.INFO)
end

vim.keymap.set('n', '<leader>cg', copy_git_relative_path, { desc = 'Copy path relative to git root' })

-- === spell ===
-- toggle spell
vim.keymap.set('n', '<leader>ss', function()
  vim.opt.spell = not vim.opt.spell:get()
end, { desc = 'Toggle spellcheck' })

-- next / previous misspelling
vim.keymap.set('n', '<leader>sn', ']s', { desc = 'Next misspelling' })
vim.keymap.set('n', '<leader>sp', '[s', { desc = 'Previous misspelling' })

-- suggestions
vim.keymap.set('n', '<leader>sc', 'z=', { desc = 'Spelling suggestions' })

-- add word (persistent)
vim.keymap.set('n', '<leader>sa', 'zg', { desc = 'Add word to spellfile' })

-- add word (buffer-local)
vim.keymap.set('n', '<leader>sA', 'zG', { desc = 'Add word (buffer only)' })

-- mark as wrong
vim.keymap.set('n', '<leader>sw', 'zw', { desc = 'Mark word as wrong' })

-- undo last zg/zw
vim.keymap.set('n', '<leader>su', 'zug', { desc = 'Undo spell add/remove' })

-- === minimalist python snippets handling ===
local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>si', function()
    local ft = vim.bo.filetype
    local snippet_file = vim.fn.expand('~/.config/nvim/snippets/' .. ft .. '_snippets.txt')

    if vim.fn.filereadable(snippet_file) == 0 then
        print('No snippet file found for filetype: ' .. ft)
        return
    end

    -- Parse snippets
    local snippets = {}
    local current_name = nil
    local current_text = {}

    for line in io.lines(snippet_file) do
        local header = line:match('^#%s*(.-):')
        if header then
            if current_name then
                table.insert(snippets, {name=current_name, text=table.concat(current_text, '\n')})
            end
            current_name = header
            current_text = {}
        else
            table.insert(current_text, line)
        end
    end
    if current_name then
        table.insert(snippets, {name=current_name, text=table.concat(current_text, '\n')})
    end

    -- Prepare choices and map for preview
    local choices = {}
    local choice_map = {}
    for _, s in ipairs(snippets) do
        table.insert(choices, s.name)
        choice_map[s.name] = s.text
    end

    fzf.fzf_exec(choices, {
        prompt = 'Snippet> ',
        preview = function(selected)
            local text = choice_map[selected[1]] or ''
            return text
        end,
        actions = {
            ['default'] = function(selected)
                local text = choice_map[selected[1]]
                if text then
                    local lines = vim.split(text, '\n')
                    vim.api.nvim_put(lines, 'l', true, true)
                end
            end
        }
    })
end, { desc = 'Insert snippet' })
