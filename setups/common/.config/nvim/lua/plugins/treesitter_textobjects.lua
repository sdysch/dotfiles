return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
  lazy = false,
  config = function()
    -- Setup textobjects
    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
        },
        include_surrounding_whitespace = false,
      },
    })

    local ts_select = require("nvim-treesitter-textobjects.select")

    vim.keymap.set({ "o", "x" }, "af", function()
      ts_select.select_textobject("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "o", "x" }, "if", function()
      ts_select.select_textobject("@function.inner", "textobjects")
    end)
    vim.keymap.set({ "o", "x" }, "ac", function()
      ts_select.select_textobject("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "o", "x" }, "ic", function()
      ts_select.select_textobject("@class.inner", "textobjects")
    end)
    vim.keymap.set({ "o", "x" }, "aa", function()
      ts_select.select_textobject("@parameter.outer", "textobjects")
    end)
    vim.keymap.set({ "o", "x" }, "ia", function()
      ts_select.select_textobject("@parameter.inner", "textobjects")
    end)
  end,
}
