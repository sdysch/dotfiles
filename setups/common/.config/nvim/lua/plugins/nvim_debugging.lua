return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'igorlfs/nvim-dap-view',
		'mfussenegger/nvim-dap-python',
	},
	keys = {
		-- basic
		{ '<leader>dt', '<cmd>DapViewToggle<cr>', desc = 'Toggle DapView' },
		{ '<leader>db', '<cmd>DapToggleBreakpoint<cr>' , desc = 'Toggle Dap breakpoint'},
		{ '<leader>de', '<cmd>DapEval<cr>' , desc = 'DapEval'},
		{ '<leader>dc', '<cmd>DapContinue<cr>' , desc = 'DapContinue'},
		{ '<leader>dw', '<cmd>DapViewWatch<cr>' , desc = 'DapViewWatch'},
		{ '<leader>dl', '<cmd>DapShowLog<cr>' , desc = 'DapShowLog'},

		-- Stepping with arrow keys
		{ '<Right>', '<cmd>DapStepOver<cr>', desc = 'Step over' },
		{ '<Down>',  '<cmd>DapStepInto<cr>', desc = 'Step into' },
		{ '<Up>',    '<cmd>DapStepOut<cr>',  desc = 'Step out' },

		-- Frame navigation
		{ '<leader>du', '<cmd>DapUp<cr>', desc = 'Dap Up frame' },
		{ '<leader>dd', '<cmd>DapDown<cr>', desc = 'Dap Down frame' },

	},
	config = function()
		local dap = require('dap')

		-- setup breakpoint colours
		-- Red breakpoint for Nord theme
		vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
		vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#BF616A', bold = true })

		-- Green arrow for stopped line
		vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = '', numhl = '' })
		vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#A3BE8C', bold = true })

		----------------------------------------------------------------
		-- Dynamically select a Python adapter:
		--   1. Use uv venv python if debugpy is installed
		--   2. Otherwise run adapter via `uv run --with debugpy`
		----------------------------------------------------------------
		local function python_adapter()
			-- Check whether debugpy exists in the uv venv
			vim.fn.system({
				'uv',
				'run',
				'python',
				'-c',
				'import debugpy',
			})

			if vim.v.shell_error == 0 then
				-- Stable case: adapter runs directly in venv
				local python = vim.fn.system({
					'uv',
					'run',
					'python',
					'-c',
					'import sys; print(sys.executable)',
				})

				python = vim.fn.trim(python)

				return {
					type = 'executable',
					command = python,
					args = { '-m', 'debugpy.adapter' },
				}
			end

			-- Fallback: run adapter through uv with ephemeral debugpy
			vim.notify(
				'debugpy not found in uv venv; using uv run --with debugpy adapter',
				vim.log.levels.INFO
			)

			return {
				type = 'executable',
				command = 'uv',
				args = {
					'run',
					'--with',
					'debugpy',
					'python',
					'-m',
					'debugpy.adapter',
				},
			}
		end

		dap.adapters.python = python_adapter()

		----------------------------------------------------------------
		-- Python launch configuration (program always runs via uv)
		----------------------------------------------------------------
		dap.configurations.python = {
			{
				type = 'python',
				request = 'launch',
				name = 'uv run (auto debugpy)',
				program = '${file}',
				cwd = vim.loop.cwd(),
				console = 'integratedTerminal',
				runInTerminal = true,

				preLaunchTask = function()
					local cmd = 'uv run ' .. vim.fn.expand('${file}')
					print('DAP launching:', cmd)
					return cmd
				end,
			},
		}
	end,
}
