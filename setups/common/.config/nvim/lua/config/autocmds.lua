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
    vim.fn.system('restart_dunst')
  end
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*waybar/*',
  callback = function()
    vim.fn.system('restart_waybar')
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
