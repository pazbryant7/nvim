return {
	{
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
	},

	{
		'bluz71/vim-moonfly-colors',
		lazy = false,
		name = 'moonfly',
		init = function()
			vim.g.moonflyItalics = false
		end,
	},

	{
		'miikanissi/modus-themes.nvim',
		opts = {
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				functions = {},
				variables = {},
			},
		},
	},

	{

		'slugbyte/lackluster.nvim',
		opts = {
			tweak_highlight = {
				['@keyword'] = {
					overwrite = false, -- overwrite falsey will extend/update lackluster's defaults (nil also does this)
					bold = false,
					italic = false,
				},
			},
		},
	},

	{
		'scottmckendry/cyberdream.nvim',
		opts = {
			italic_comments = false,
		},
	},

	{

		'Mofiqul/vscode.nvim',
		opts = {
			italic_comments = false,
			italic_inlayhints = false,
		},
	},

	{
		'NvChad/nvim-colorizer.lua',
		enabled = true,
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
