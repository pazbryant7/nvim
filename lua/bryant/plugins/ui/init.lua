return {
	{
		lazy = false,
		priority = 1000,
		'catppuccin/nvim',
		name = 'catppuccin',
		opts = {
			flavour = 'mocha', -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = 'latte',
				dark = 'mocha',
			},
			no_italic = true, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = true, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { 'italic' }, -- Change the style of comments
				conditionals = { 'italic' },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
		},
		config = function(_, opts)
			require('catppuccin').setup(opts)
			vim.cmd('colorscheme catppuccin-mocha')
		end,
	},

	{
		'Tsuzat/NeoSolarized.nvim',
		opts = {
			style = 'dark', -- "dark" or "light"
			transparent = false, -- true/false; Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			enable_italics = false, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
			styles = {
				-- Style to be applied to different syntax groups
				comments = { italic = false },
				keywords = { italic = false },
				functions = { bold = false },
				variables = {},
				string = { italic = false },
				underline = true, -- true/false; for global underline
				undercurl = true, -- true/false; for global undercurl
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
