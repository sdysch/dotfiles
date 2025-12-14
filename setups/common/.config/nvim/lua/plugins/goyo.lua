vim.g.goyo_width = 250

-- Activate Goyo for git commits
vim.api.nvim_create_autocmd({'BufRead','BufNewFile'}, {
  pattern = '*COMMIT_EDITMSG',
  callback = function()
    vim.g.goyo_width = 120
    vim.cmd('Goyo')
  end,
})
