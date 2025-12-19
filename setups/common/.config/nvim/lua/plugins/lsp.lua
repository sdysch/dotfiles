return {
  {
    "neovim/nvim-lspconfig",
    ft = { "python" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "pyright" },
      })

      -- NEW Neovim 0.11+ LSP config
      vim.lsp.config.pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      }

      -- Enable the server
      vim.lsp.enable("pyright")
    end,
  },
}
