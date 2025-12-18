return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'NvimTreeToggle', 'NvimTreeOpen' },
  config = function()
    require('nvim-tree').setup({
      renderer = {
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = true,
            git = true,
          },
        },
      },
      view = {
        width = 25,
        side = 'left',
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = true,
      },
    })

    -- Optional global variable (redundant with setup options, but safe)
    vim.g.nvim_tree_respect_buf_cwd = 1
  end,
}
