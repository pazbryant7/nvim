return {
	'echasnovski/mini.pairs',
	version = '*',
	event = 'InsertEnter',
	opts = {
		modes = { insert = true, command = false, terminal = false },
		mappings = {
			-- Enable only quotes and backticks
			['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
			["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
			['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },

			-- Explicitly disable ALL other default pairs
			['('] = false,
			['['] = false,
			['{'] = false,
			[')'] = false,
			[']'] = false,
			['}'] = false,
		},
	},
}
