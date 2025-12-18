return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      char = '│',
      tab_char = '│',
      highlight = 'NonText',
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
    },
    exclude = {
      filetypes = { 'help', 'terminal', 'lazy', 'dashboard' },
    },
  },
  event = { 'BufReadPost', 'BufNewFile' },
  config = function(_, opts)
    local ibl = require('ibl')
    ibl.setup(opts)
    vim.cmd([[highlight default link IBLIndent NonText]])
  end,
}
