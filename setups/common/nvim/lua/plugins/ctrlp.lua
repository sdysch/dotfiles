-- CtrlP
vim.g.ctrlp_custom_ignore = [[\v[\/]\.(git|hg|svn)$]]
vim.g.ctrlp_open_new_file = 'v'
vim.g.ctrlp_prompt_mappings = {
  ['AcceptSelection("h")'] = {'<c-v>', '<2-LeftMouse>', '<Enter>'},
  ['AcceptSelection("v")'] = {'<cr>', '<RightMouse>'},
}
