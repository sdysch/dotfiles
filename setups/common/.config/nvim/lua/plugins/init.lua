-- other configs defined in names files
return {
  -- theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- commenting
  -- { 'preservim/nerdcommenter', keys = { 'gc', 'gcc' } },

  -- UI helpers
  { "ap/vim-css-color", lazy = false },
  { "junegunn/vim-peekaboo", event = "VeryLazy" },

  -- colorscheme
  { "gbprod/nord.nvim", lazy = false, priority = 1000 },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- tabline
  {
    "romgrk/barbar.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- context awareness
  { "nvim-treesitter/nvim-treesitter-context", lazy = false },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },

  -- floating terminal
  {
    "numToStr/FTerm.nvim",
    cmd = { "FTermOpen", "FTermToggle" },
    keys = {
      {
        "<leader>z",
        function()
          require("FTerm").open()
        end,
        desc = "Open floating terminal",
        mode = "n",
      },
      {
        "<Esc>",
        function()
          require("FTerm").close()
        end,
        desc = "Close floating terminal",
        mode = "t",
      },
    },
  },

  -- better quickfix list syntax
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    config = function()
      require("quicker").setup({})
    end,
  },

  -- arrow for bookmarking files
  {
  "otavioschwanck/arrow.nvim",
  lazy=false,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = {
    show_icons = true,
    leader_key = ';',
    buffer_leader_key = 'm',
  }
},
}
