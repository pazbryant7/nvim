return {
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			telemetry = { enable = false },
			diagnostics = {
				globals = {
					'it',
					'vim',
					'lvim',
					'reload',
					'pending',
					'LazyVim',
					'describe',
					'after_each',
					'before_each',
				},
			},
		},
	},
}
