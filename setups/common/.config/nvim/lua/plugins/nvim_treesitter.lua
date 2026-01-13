return {
  {
	  'nvim-treesitter/nvim-treesitter',
	  lazy = false,
	  build = ':TSUpdate',
	  config = function()
		  require'nvim-treesitter'.setup {
			  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
			  install_dir = vim.fn.stdpath('data') .. '/site'
		  }

		  -- parsers
		  require'nvim-treesitter'.install {
			  "gitcommit", "gitignore", "html", "http", "json", "json5", "jsonc",
			  "lua", "make", "markdown", "markdown_inline", "python", "regex", "rst",
			  "scss", "sql", "ssh_config", "toml", "vim", "vimdoc", "yaml"
		  }

		  -- folds
		  vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		  vim.wo[0][0].foldmethod = 'expr'
		  vim.cmd('set nofoldenable') -- start with all folds open
		  vim.opt.foldlevel = 99

		  vim.api.nvim_create_autocmd('FileType', {
			  pattern = { 'python' },
			  callback = function() vim.treesitter.start() end,
		  })
	  end
  },
}
