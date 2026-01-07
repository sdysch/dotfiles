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
  -- { 'github/copilot.vim', lazy = false },

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
