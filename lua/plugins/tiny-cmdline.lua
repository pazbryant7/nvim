return {
	'rachartier/tiny-cmdline.nvim',
	enabled = function()
		return vim.fn.has('nvim-0.12') == 1
	end,
	lazy = false,
	init = function()
		vim.o.cmdheight = 0
		require('vim._core.ui2').enable({})
	end,
	config = function()
		local tiny_cmdline = require('tiny-cmdline')
		tiny_cmdline.setup({
			on_reposition = tiny_cmdline.adapters.blink,
		})
	end,
}
