return {
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
			  local path = vim.fn.fnameescape(vim.g.wiki_root .. '/todo.md')
			  vim.cmd('e ' .. path)
		  end

		  function WikiNotes()
			  local path = vim.fn.fnameescape(vim.g.wiki_root .. '/notes.md')
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
			  pattern = '*.md',
			  callback = function()
				  vim.bo.filetype = 'vimwiki'
			  end,
		  })


		  -- Keymaps
		  vim.keymap.set('n', '<leader>wt', WikiTodo, { desc = 'Open Vimwiki TODO', silent = true })
          vim.keymap.set('n', '<leader>wn', WikiNotes, { desc = 'Open Vimwiki notes', silent = true })
		  vim.keymap.set('n', 'gx', function()
			  local url = vim.fn.expand('<cfile>')
			  vim.fn.jobstart({ 'open', url }, { detach = true })
		  end)

	  end
  },
}
