-- other configs defined in names files
return {
  -- commenting
  { 'preservim/nerdcommenter', keys = { 'gc', 'gcc' } },

  -- UI helpers
  { 'ap/vim-css-color', lazy = false },
  { 'junegunn/vim-peekaboo', event = 'VeryLazy' },

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

}
