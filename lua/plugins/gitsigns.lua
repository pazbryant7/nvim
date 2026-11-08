return {
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	opts = {
		on_attach = function(buffer)
			local gitsigns = require('gitsigns')

			local function map(lhs, rhs, desc)
				vim.keymap.set('n', lhs, rhs, { buffer = buffer, desc = desc, silent = true })
			end

			map(']c', function()
				if vim.wo.diff then
					vim.cmd.normal({ ']c', bang = true })
				else
					gitsigns.nav_hunk('next')
				end
			end, 'Gitsigns: Next hunk')

			map('[c', function()
				if vim.wo.diff then
					vim.cmd.normal({ '[c', bang = true })
				else
					gitsigns.nav_hunk('prev')
				end
			end, 'Gitsigns: Previous hunk')
		end,
	},
}
