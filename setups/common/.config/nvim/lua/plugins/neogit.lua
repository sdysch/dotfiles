return {
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
    },
    config = function()
      -- Setup Diffview
      require("diffview").setup({
        enhanced_diff_hl = true,
        use_icons = true,
        key_bindings = {
          view = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
          },
          file_panel = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
          },
        },
      })

      -- Setup Neogit
      require("neogit").setup({
        integrations = { diffview = true },
      })

      vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>gq", "<cmd>DiffviewClose<cr>", { noremap = true, silent = true })
    end,
  },
}
