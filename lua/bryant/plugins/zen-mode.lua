return {
	'folke/zen-mode.nvim',
	opts = {
		window = {
			backdrop = 100, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 90, -- width of the Zen window
		},
		options = {
			signcolumn = 'no', -- disable signcolumn
			number = false, -- disable number column
			relativenumber = false, -- disable relative numbers
			cursorline = false, -- disable cursorline
			cursorcolumn = false, -- disable cursor column
			foldcolumn = '0', -- disable fold column
			list = false, -- disable whitespace characters
		},
		plugins = {
			-- disable some global vim options (vim.o...)
			-- comment the lines to not apply the options
			options = {
				enabled = true,
				ruler = false, -- disables the ruler text in the cmd line area
				showcmd = false, -- disables the command in the last line of the screen
				laststatus = 0, -- turn off the statusline in zen mode
			},
			twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
			gitsigns = { enabled = true }, -- disables git signs
			tmux = { enabled = true }, -- disables the tmux statusline
			todo = { enabled = true }, -- if set to "true", todo-comments.nvim highlights will be disabled
		},
	},
	keys = {
		{
			'zm',
			mode = 'n',
			'<cmd>ZenMode<CR>',
			desc = 'Zen mode',
		},
	},
}
