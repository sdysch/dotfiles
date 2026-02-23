return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeOpen" },
  keys = {
    {
      "<leader>e",
      "<cmd>NvimTreeToggle<cr>",
      desc = "Toggle file explorer",
      mode = "n",
    },
  },
  config = function()
    require("nvim-tree").setup({
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
        side = "left",
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = true,
      },

      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        -- l: open file / expand directory
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open file/dir"))

        -- h: close directory
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close directory"))
      end,
    })

    -- Optional
    vim.g.nvim_tree_respect_buf_cwd = 1
  end,
}
