return {
	javascript = {
		{
			name = 'Launch file using node',
			type = 'pwa-node',
			request = 'launch',
			program = '${file}',
			cwd = '${workspaceFolder}',
			skipFiles = { 'node_modules/**' },
		},
	},
}
