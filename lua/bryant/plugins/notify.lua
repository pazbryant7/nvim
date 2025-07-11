return {
	event = 'BufEnter',
	'rcarriga/nvim-notify',
	init = function()
		vim.notify = require('notify')
	end,
	opts = {
		render = 'default', -- minimal/compact/default/simple
	},
}
