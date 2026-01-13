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

  -- distraction-free writing
  {
    'junegunn/goyo.vim',
    cmd = { 'Goyo' },
  },

  -- wiki
  {
    'vimwiki/vimwiki',
    lazy = false,
    ft = { 'wiki', 'markdown' },
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
  { 'nvim-treesitter/nvim-treesitter', lazy = false, build = ':TSUpdate' }

}
