return {
  {
    "lervag/vimtex",
    ft = { "tex" },
    config = function()
      -- Fix tex filetype
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*.tex",
        callback = function()
          vim.bo.filetype = "tex"
        end,
      })
    end,
  },
}
