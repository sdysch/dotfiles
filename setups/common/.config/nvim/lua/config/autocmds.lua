local autocmd = vim.api.nvim_create_autocmd

-- Restore cursor position
autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local mark = vim.fn.line("'\"")
    if mark > 0 and mark <= vim.fn.line("$") then
      vim.cmd('normal! g\'"')
    end
  end,
})

-- Text wrapping for LaTeX
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function()
    vim.opt_local.textwidth = 100
  end
})

-- Rerun system commands on save
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*compton.conf',
  callback = function()
    vim.fn.system('killall picom && picom -b --config ~/.config/compton/compton.conf &')
  end
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*dunstrc',
  callback = function()
    vim.fn.system('pkill -x dunst 2>/dev/null; dunst & disown; notify_info "Info" "Dunst restarted"')
  end
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*waybar/*',
  callback = function()
    vim.fn.system('pkill -x waybar 2>/dev/null; waybar & disown; notify_info "Info" "Waybar restarted"')
  end
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = {'*Xresources','*Xdefaults'},
  callback = function()
    vim.fn.system('xrdb ' .. vim.fn.expand('%'))
  end
})

-- autocreate missing directories on save
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    local dir = vim.fn.fnamemodify(vim.fn.expand('%'), ':p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- start terminal splits in insert mode (why else would you open a terminal?)
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.cmd('startinsert')
  end,
})

-- disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
		pattern = "*",
		callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
		end,
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
	vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- close iron.nvim repl if it's the last buffer open
vim.api.nvim_create_autocmd('BufDelete', {
  callback = function(args)
    -- iron.nvim sets this buffer variable
    if not vim.b[args.buf].iron_repl then
      return
    end

    -- count remaining listed buffers
    local listed = vim.tbl_filter(function(b)
      return vim.fn.buflisted(b) == 1
    end, vim.api.nvim_list_bufs())

    if #listed == 0 then
      vim.cmd('quit')
    end
  end,
})

--- backup vimwiki ---
local wiki_root = vim.fn.expand(vim.env.VIMWIKI or "~/Documents/vimwiki")
wiki_root = wiki_root:gsub("/+$","")

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.md",
    callback = function(args)
        local buf_path = vim.fn.expand(args.file)

        -- Exit if file is not inside wiki_root
        if buf_path:sub(1, #wiki_root) ~= wiki_root then
            return
        end

        -- Run backup if available
        if vim.fn.executable("backup_vimwiki") == 1 then
            vim.fn.system("backup_vimwiki")
        end
    end,
})


--- update waybar todo module on save ---
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*todo.md',
  callback = function()
    vim.fn.system({
    	'sh',
    	'-c',
    	'command -v vimwiki_todo waybar > /dev/null && pkill -RTMIN+10 waybar'
	})
  end
})

-- automatically enable spell check on certain files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitcommit', 'markdown', 'text' },
  callback = function()
    vim.opt_local.spell = true
  end,
})
