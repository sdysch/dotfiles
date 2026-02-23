-- other configs defined in names files
return {
  -- theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "gbprod/nord.nvim", lazy = false, priority = 1000 },

  -- UI helpers
  { "ap/vim-css-color", lazy = false },
  { "junegunn/vim-peekaboo", event = "VeryLazy" },

  -- tabline
  { "romgrk/barbar.nvim", lazy = false, dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- context awareness
  { "nvim-treesitter/nvim-treesitter-context", lazy = false },

  -- which-key
  { "folke/which-key.nvim", event = "VeryLazy" },

  -- better quickfix list syntax
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    config = function()
      require("quicker").setup({})
    end,
  },
}
