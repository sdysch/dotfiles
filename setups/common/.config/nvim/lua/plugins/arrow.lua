return {
  "otavioschwanck/arrow.nvim",
  keys = {
    { ";", mode = { "n", "v" } },
    { "m", mode = { "n", "v" } },
  },
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = {
    show_icons = true,
    leader_key = ";",
    buffer_leader_key = "m",
  },
}
