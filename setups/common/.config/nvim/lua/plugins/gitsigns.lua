return {
  {
    'lewis6991/gitsigns.nvim',
    cmd = { 'Gitsigns' },
    keys = {
      {
        '<leader>gb',
        function()
          require('gitsigns').toggle_current_line_blame()
        end,
        desc = 'Toggle inline git blame',
      },
    },
    config = function()
      require('gitsigns').setup({
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 300,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> · <summary>',
      })
    end,
  }
}
