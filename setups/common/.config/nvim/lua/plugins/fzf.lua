return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'FzfLua',
    keys = {
      { '<C-p>', '<cmd>FzfLua git_files<CR>', desc = 'fzf files in git' },
      { '<C-b>', '<cmd>FzfLua buffers<CR>', desc = 'fzf buffers' },
      { '<C-f>', '<cmd>FzfLua live_grep<CR>', desc = 'fzf live grep' },
      { '<leader>*', '<cmd>FzfLua grep_cword<CR>', desc = 'live grep on current word' },
      { '<leader>fr', '<cmd>FzfLua oldfiles<CR>', desc = 'Find recent files' },
      { '<leader>fk', '<cmd>FzfLua keymaps<CR>', desc = 'FzfLua: Show keymaps' },
      { '<leader>fc', '<cmd>FzfLua commands<CR>', desc = 'FzfLua: Show commands' },
    },

    config = function()
      require('fzf-lua').setup({
        defaults = {
          actions = {
            ['ctrl-q'] = { fn = require('fzf-lua').actions.file_sel_to_qf, prefix = 'select-all' },
          },
        },
        grep = {
          rg_opts = '--hidden --glob !.git/* --line-number --no-heading --color=always --smart-case --column'
        },
      })
    end,
  },
}
