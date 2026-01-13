-- other configs defined in names files
return {

  -- git
  { 'tpope/vim-fugitive', cmd = { 'Git', 'G', 'Gstatus', 'Gdiffsplit'} },

  -- commenting
  { 'preservim/nerdcommenter', keys = { 'gc', 'gcc' } },

  -- fuzzy finder
  {
	  'ibhagwan/fzf-lua',
	  dependencies = { 'nvim-tree/nvim-web-devicons' },
	  config = function()
		  require('fzf-lua').setup({
		  	  defaults = {
				  actions = {
					  ['ctrl-q'] = { fn = require('fzf-lua').actions.file_sel_to_qf, prefix = 'select-all' },
				  },
			  },
			  grep = {
				  rg_opts = '--hidden --glob !.git/* --line-number --no-heading --color=always --smart-case --column'
			  },
		  })
	  end,
  },


  -- LaTeX
  { 'lervag/vimtex', ft = { 'tex' } },

  -- vim wiki
  {
	  'vimwiki/vimwiki',
	  lazy = false,
	  config = function()
		  -- Set global variables
		  vim.g.vimwiki_list = {
			  { path = os.getenv('VIMWIKI') }
		  }
		  vim.g.wiki_root = os.getenv('VIMWIKI')


		  -- Define helper functions
		  function WikiTodo()
			  local path = vim.fn.fnameescape(vim.g.wiki_root .. '/todo.wiki')
			  vim.cmd('e ' .. path)
		  end

		  function WikiNotes()
			  local path = vim.fn.fnameescape(vim.g.wiki_root .. '/notes.wiki')
			  vim.cmd('e ' .. path)
		  end

		  -- Backup Vimwiki automatically
		  vim.api.nvim_create_autocmd('BufWritePost', {
			  pattern = '*.wiki',
			  callback = function()
				  if vim.fn.executable('backup_vimwiki') == 1 then
					  vim.fn.system('backup_vimwiki')
				  end
			  end
		  })

		  -- vimwiki syntax
		  vim.api.nvim_create_augroup('vimwiki_ft', { clear = true })

		  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
			  group = 'vimwiki_ft',
			  pattern = '*.wiki',
			  callback = function()
				  vim.bo.filetype = 'vimwiki'
			  end,
		  })

	  end
  },

  -- UI helpers
  { 'ap/vim-css-color', lazy = false },
  { 'junegunn/vim-peekaboo', event = 'VeryLazy' },

  -- copilot
  {
    'zbirenbaum/copilot.lua',
    dependencies = {
      'copilotlsp-nvim/copilot-lsp',
    },
    cmd = { 'Copilot' },
    keys = { { '<leader>ct', '<Cmd>Copilot toggle<CR>', mode = 'n', desc = 'Copilot toggle' } },
    config = function()
      require('copilot').setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = '<C-l>',
            -- next = '<C-]>',
            -- prev = '<C-[>',
            -- dismiss = '<C-]>',
          },
        },
        filetypes = {
          markdown = true,
          python = true,
          lua = true,
          bash = true,
          zsh = true,
          sh = true,
          gitcommit = false,
          help = false,
        },
      })

      vim.keymap.set('n', '<leader>ct', '<Cmd>Copilot toggle<CR>', { 
        noremap = true, 
        silent = true, 
        desc = 'Toggle Copilot' 
      })
    end,
  },

  -- colorscheme
  { 'gbprod/nord.nvim', lazy = false, priority = 1000 },

  -- icons
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- tabline
  {
    'romgrk/barbar.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- context awareness
  { 'nvim-treesitter/nvim-treesitter-context', lazy = false},

  -- which-key
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
  },

  -- floating terminal
  { 'numToStr/FTerm.nvim', cmd = { 'FTermOpen', 'FTermToggle' } },

  -- csv viewer
  { 'emmanueltouzery/decisive.nvim', ft = { 'csv' } },

  -- tree sitter
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
  }

}
