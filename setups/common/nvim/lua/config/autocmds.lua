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
autocmd('FileType', { pattern = 'tex', command = 'setlocal textwidth=100' })

-- Rerun system commands on save
autocmd('BufWritePost', { pattern = '*compton.conf', command = '!killall picom && picom -b --config ~/.config/compton/compton.conf &' })
autocmd('BufWritePost', { pattern = '*dunstrc', command = '!restart_dunst' })
autocmd('BufWritePost', { pattern = '*waybar/*', command = '!restart_waybar' })
autocmd('BufWritePost', { pattern = '*Xresources,*Xdefaults', command = '!xrdb %' })

-- Fix tex filetype
autocmd({'BufRead','BufNewFile'}, { pattern = '*.tex', command = 'set filetype=tex' })

-- Backup Vimwiki automatically
autocmd('BufWritePost', { pattern = '*.wiki', command = 'if executable("backup_vimwiki") | !backup_vimwiki | endif' })
