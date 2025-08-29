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

-- Fix tex filetype
vim.api.nvim_create_autocmd({'BufRead','BufNewFile'}, {
  pattern = '*.tex',
  callback = function()
    vim.bo.filetype = 'tex'
  end
})

-- Backup Vimwiki automatically
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.wiki',
  callback = function()
    if vim.fn.executable('backup_vimwiki') == 1 then
      vim.fn.system('backup_vimwiki')
    end
  end
})
