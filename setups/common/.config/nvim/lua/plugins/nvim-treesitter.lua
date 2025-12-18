return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',  -- ensures parsers are updated
  config = function()
    require('nvim-treesitter.configs').setup({
      -- Directory to install parsers
      parser_install_dir = vim.fn.stdpath('data') .. '/site',

      -- Parsers to ensure installed
      ensure_installed = {
        "gitcommit",
        "gitignore",
        "go",
        "groovy",
        "hcl",
        "heex",
        "html",
        "http",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "rst",
        "rust",
        "scss",
        "sql",
        "ssh_config",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "typst",
        "vim",
        "vimdoc",
        "yaml",
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      -- Optional: folding
      fold = {
        enable = true,
        disable = {},
      },
    })

    -- Treesitter-based folding
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.cmd('set nofoldenable') -- start with all folds open

    -- Optional: automatically start treesitter for specific filetypes
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'python', 'lua', 'javascript', 'typescript', 'rust', 'go', 'html', 'css', 'json' },
      callback = function(args)
        local bufnr = args.buf
        local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
        local parser = vim.treesitter.language.get_lang(ft)
        if parser then
          pcall(vim.treesitter.start, bufnr, parser)
        end
      end,
    })
  end,
}
