require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require'nvim-treesitter'.install {
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
}

-- automatically start treesitter for specific filetypes
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
    callback = function(args)
        local bufnr = args.buf
        local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
        local parser = vim.treesitter.language.get_lang(ft)
        if parser then
            pcall(vim.treesitter.start, bufnr, parser)
        end
    end,
})

-- enable tree-sitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.cmd('set nofoldenable') -- start with all folds open
