return {
	'nvim-mini/mini.icons',
	version = false,
	lazy = false,
	priority = 1001,
	config = function()
		local mini_icons = require('mini.icons')
		mini_icons.setup()
		mini_icons.mock_nvim_web_devicons()
	end,
}
