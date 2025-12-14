require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'lua',
    'json',
	'markdown',
	'markdown_inline',
	'html',
    'python',
    'vim',
    'vimdoc'
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },

  indent = {
    enable = true
  }
})
