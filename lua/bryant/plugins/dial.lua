return {
	'monaqa/dial.nvim',
	config = function()
		local augend = require('dial.augend')
		require('dial.config').augends:register_group({
			default = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.date.alias['%Y/%m/%d'],
				augend.constant.alias.bool,
				augend.semver.alias.semver,
				augend.constant.new({ elements = { 'let', 'const' } }),
			},
		})

		-- Helper function to move cursor to start of word after dial operation
		local function dial_with_cursor_fix(operation, mode)
			return function()
				local cursor_pos = vim.api.nvim_win_get_cursor(0)
				require('dial.map').manipulate(operation, mode)

				-- For normal mode operations, move cursor to start of the changed word
				if mode == 'normal' or mode == 'gnormal' then
					-- Move to start of current word
					vim.cmd('normal! b')
				end
			end
		end

		-- Set up the wrapper functions
		_G.dial_increment_normal = dial_with_cursor_fix('increment', 'normal')
		_G.dial_decrement_normal = dial_with_cursor_fix('decrement', 'normal')
		_G.dial_increment_gnormal = dial_with_cursor_fix('increment', 'gnormal')
		_G.dial_decrement_gnormal = dial_with_cursor_fix('decrement', 'gnormal')
	end,
	keys = {
		-- Normal mode with cursor positioning fix
		{
			'<C-a>',
			function()
				_G.dial_increment_normal()
			end,
		},
		{
			'<C-x>',
			function()
				_G.dial_decrement_normal()
			end,
		},
		{
			'g<C-a>',
			function()
				_G.dial_increment_gnormal()
			end,
		},
		{
			'g<C-x>',
			function()
				_G.dial_decrement_gnormal()
			end,
		},

		-- Visual mode (original behavior - cursor positioning less relevant in visual mode)
		{
			'<C-a>',
			mode = 'v',
			function()
				require('dial.map').manipulate('increment', 'visual')
			end,
		},
		{
			'<C-x>',
			mode = 'v',
			function()
				require('dial.map').manipulate('decrement', 'visual')
			end,
		},
		{
			'g<C-a>',
			mode = 'v',
			function()
				require('dial.map').manipulate('increment', 'gvisual')
			end,
		},
		{
			'g<C-x>',
			mode = 'v',
			function()
				require('dial.map').manipulate('decrement', 'gvisual')
			end,
		},
	},
}
