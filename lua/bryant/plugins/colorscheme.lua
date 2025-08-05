return {
	'catppuccin/nvim',
	name = 'catppuccin',
	opts = {
		flavour = 'auto', -- latte, frappe, macchiato, mocha
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
}
