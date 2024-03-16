return {
	'NvChad/nvim-colorizer.lua',
	event = 'BufReadPre',
	opts = {
		filetypes = {
			'*',
			'!vim',
			'!TelescopePrompt',
			'!fzf',
			html = { mode = 'background' },
			css = { mode = 'background' },
		},
		user_default_options = { mode = 'foreground' },
	},
}
