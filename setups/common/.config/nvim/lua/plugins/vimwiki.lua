return {
  {
	  'vimwiki/vimwiki',
	  lazy = false,
	  config = function()
		  -- Set global variables
		  vim.g.vimwiki_list = {
			  { path = os.getenv('VIMWIKI'), syntax = 'markdown', ext = 'md' }
		  }
		  vim.g.wiki_root = os.getenv('VIMWIKI')
		  -- not all markdown files are vimwiki
		  vim.g.vimwiki_global_ext = 0
		  vim.g.vimwiki_ext2syntax = {}

		  -- Define helper functions
		  function WikiTodo()
			  local path = vim.fn.fnameescape(vim.g.wiki_root .. '/todo.md')
			  vim.cmd('e ' .. path)
		  end

		  function WikiNotes()
			  local path = vim.fn.fnameescape(vim.g.wiki_root .. '/notes.md')
			  vim.cmd('e ' .. path)
		  end

		  -- Backup Vimwiki automatically, only for files inside the wiki
		  vim.api.nvim_create_autocmd('BufWritePost', {
			  pattern = '*.md',
			  callback = function(args)
				  local wiki_root = vim.g.wiki_root
				  local buf_path = vim.fn.expand(args.file)
				  -- only backup if the file is inside the wiki directory
				  if wiki_root and buf_path:sub(1, #wiki_root) == wiki_root then
					  if vim.fn.executable('backup_vimwiki') == 1 then
						  vim.fn.system('backup_vimwiki')
					  end
				  end
			  end
		  })

		  -- Toggle TODO with <Space> in normal mode
		  vim.api.nvim_create_autocmd('FileType', {
			  pattern = 'vimwiki',
			  callback = function()
				  vim.keymap.set('n', '<Space>', function()
					  vim.cmd('VimwikiToggleListItem')
				  end, { buffer = true, desc = 'Toggle TODO under cursor' })
			  end,
		  })

		  -- vimwiki syntax
		  vim.api.nvim_create_augroup('vimwiki_ft', { clear = true })

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
