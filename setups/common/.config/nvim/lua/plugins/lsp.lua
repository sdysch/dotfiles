return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "bashls", "sqls", "yamlls", "jsonls", "marksman" },
        automatic_installation = true,
      })

      -- LSP configs
      vim.lsp.config.pyright = {
        filetypes = { "python" },
        settings = {
          python = {
          	venvPath = '.',
          	venv = '.venv',
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      }

      vim.lsp.config.bashls = { filetypes = { "sh", "bash", "zsh" } }
      vim.lsp.config.sqls = { filetypes = { "sql" } }
      vim.lsp.config.yamlls = { filetypes = { "yaml" } }
      vim.lsp.config.jsonls = { filetypes = { "json" } }
      vim.lsp.config.marksman = { filetypes = { "markdown" } }

      -- Enable servers
      vim.lsp.enable({
        "pyright",
        "bashls",
        "sqls",
        "yamlls",
        "jsonls",
        "marksman",
      })
    end,
  },
}
