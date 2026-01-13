return {
	{
		'tpope/vim-fugitive',
		cmd = { 'Git', 'G', 'Gstatus', 'Gdiffsplit'},
		keys = {
			{ '<leader>gs', '<cmd>Git status<CR>', desc = 'Git status', noremap = true, silent = true },
			{ '<leader>gc', '<cmd>Git commit<CR>', desc = 'Git commit', noremap = true, silent = true },
			{ '<leader>gd', '<cmd>Gdiffsplit<CR>', desc = 'Git diffsplit', noremap = true, silent = true },
			{ '<leader>gt', '<cmd>G difftool<CR>', desc = 'Git difftool', noremap = true, silent = true },
		}

	},
}
