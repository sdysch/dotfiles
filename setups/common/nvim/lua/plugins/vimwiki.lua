-- Vimwiki
vim.g.vimwiki_list = {{ path = os.getenv('VIMWIKI') }}
vim.g.wiki_root = os.getenv('VIMWIKI')

function WikiTodo()
  local path = vim.fn.fnameescape(vim.g.wiki_root .. '/todo.wiki')
  vim.cmd('e ' .. path)
end

function WikiNotes()
  local path = vim.fn.fnameescape(vim.g.wiki_root .. '/notes.wiki')
  vim.cmd('e ' .. path)
end
