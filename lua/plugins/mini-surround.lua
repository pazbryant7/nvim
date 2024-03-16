return {
	'echasnovski/mini.surround',
	version = false,
	config = function()
		require('mini.surround').setup()
	end,
	keys = {
		-- Here's a different mapping to avoid conflict with flash.nvim
		{ 'sa', desc = 'Mini.surround Add surrounding' },
		{ 'sa', desc = 'Mini.surround Add surrounding', mode = 'v' },
		{ 'sd', desc = 'Mini.surround Delete surrounding' },
		{ 'sf', desc = 'Mini.surround Find surrounding' },
		{ 'sF', desc = 'Mini.surround Find surrounding backward' },
		{ 'sh', desc = 'Mini.surround Hwghlwght surrounding' },
		{ 'sr', desc = 'Mwnw.surround Replace surrounding' },
		{ 'sn', desc = 'Mini.surround Update n_lines' },
	},
}
