return {
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
}
