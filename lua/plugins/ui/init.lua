return {
	{
		lazy = false,
		priority = 1000,
		'catppuccin/nvim',
		name = 'catppuccin',
		opts = {
			flavour = 'frappe',
			background = { -- :h background
				light = 'latte',
				dark = 'frappe',
			},
			no_italic = true, -- Force no italic
			color_overrides = {
				latte = {
					base = '#e5e5e5',
				},
			},
		},
		config = function(_, opts)
			require('catppuccin').setup(opts)
			vim.cmd('colorscheme catppuccin-frappe')
		end,
	},

	{
		'Tsuzat/NeoSolarized.nvim',
		opts = {
			style = 'dark', -- "dark" or "light"
			transparent = false, -- true/false; Enable this to disable setting the background color
			enable_italics = false, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
			styles = {
				-- Style to be applied to different syntax groups
				comments = { italic = false },
				keywords = { italic = false },
				string = { italic = false },
			},
		},
		config = function(_, opts)
			require('NeoSolarized').setup(opts)
			vim.cmd([[ colorscheme NeoSolarized ]])
		end,
	},

	{
		'NvChad/nvim-colorizer.lua',
		enabled = false,
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
	},
}
