return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
    },
    config = function()
      -- Mason
      require('mason').setup()

      require('mason-lspconfig').setup({
        ensure_installed = {
          'bashls',
          -- 'jedi_language_server',
          'marksman',
          'pyright',
          'yamlls',
          'ruff',
          -- 'jsonls',
          -- 'sqls',
        },
        automatic_installation = true,
      })

      -- LSP on_attach (keymaps go here)
      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        local function map(lhs, rhs, desc)
          vim.keymap.set('n', lhs, rhs, vim.tbl_extend('force', opts, {
            desc = desc,
          }))
        end

        map('gd', vim.lsp.buf.definition, 'Go to definition')
        map('K', vim.lsp.buf.hover, 'Hover documentation')
        map('gr', vim.lsp.buf.references, 'List references')
        map('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
        map('<leader>E', vim.diagnostic.open_float, 'Diagnostics')
    map('<leader>ca', function()
      require('fzf-lua').lsp_code_actions()
    end, 'fzf code action')

      end

      -- LSP configs
      vim.lsp.config.pyright = {
        on_attach = on_attach,
        filetypes = { 'python' },
        settings = {
          python = {
            venvPath = '.',
            venv = '.venv',
            analysis = {
              typeCheckingMode = 'basic',
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      }

      vim.lsp.config.bashls = {
        on_attach = on_attach,
        filetypes = { 'sh', 'bash', 'zsh' },
      }

      -- vim.lsp.config.sqls = {
      --   on_attach = on_attach,
      --   filetypes = { 'sql' },
      -- }

      vim.lsp.config.yamlls = {
        on_attach = on_attach,
        filetypes = { 'yaml' },
      }

      -- vim.lsp.config.jsonls = {
      --   on_attach = on_attach,
      --   filetypes = { 'json' },
      -- }

      vim.lsp.config.marksman = {
        on_attach = on_attach,
        filetypes = { 'markdown', 'vimwiki' },
      }

      -- vim.lsp.config.jedi_language_server = {
      --   on_attach = on_attach,
      --   filetypes = { 'python' },
      --   root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" }
      -- }

      vim.lsp.config.ruff= {
        on_attach = on_attach,
        filetypes = { 'python' },
        init_options = {
          settings = {
            args = {},
          },
        },
      }


      -- Enable servers
      vim.lsp.enable({
        'bashls',
        -- 'jedi_language_server',
        'marksman',
        'pyright',
        'yamlls',
        'ruff',
        -- 'jsonls',
        -- 'sqls',
      })
    end,
  },
}
