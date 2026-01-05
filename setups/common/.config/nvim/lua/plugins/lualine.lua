return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_lsp' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ' },
      colored = true,
      update_in_insert = false,
      always_visible = true,
      cond = function()
        return vim.bo.filetype ~= 'markdown'
      end,
    }

    local diff = {
      'diff',
      colored = true,
      symbols = { added = ' ', modified = ' ', removed = ' ' },
    }

    local mode = {
      'mode',
      fmt = function(str)
        return '-- ' .. str .. ' --'
      end,
    }

    local branch = {
      'branch',
      icon = '',
    }

	local progress = {
	  function()
		local current = vim.fn.line('.')
		local total = vim.fn.line('$')

		if total <= 1 then
		  return ''
		end

		local chars = { '', '', '', '' }
		local ratio = current / total
		local index = math.max(1, math.min(#chars, math.ceil(ratio * #chars)))

		return chars[index] .. ' ' .. math.floor(ratio * 100) .. '%'
	  end,
	}


    lualine.setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'dashboard' },
        always_divide_middle = true,
      },

      sections = {
        lualine_a = { branch },
        lualine_b = { mode },
        lualine_c = { diagnostics },
        lualine_x = { diff, 'fileformat', 'filetype' },
        lualine_y = { 'location' },
        -- lualine_z = { progress },
      },

      extensions = { 'nvim-tree' },
    })
  end,
}
