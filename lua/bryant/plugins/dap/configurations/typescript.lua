return {
	typescript = {
		{
			name = 'Launch TypeScript file with tsx',
			type = 'pwa-node',
			request = 'launch',
			runtimeExecutable = 'npx',
			runtimeArgs = { 'tsx', '${file}' },
			cwd = '${workspaceFolder}',
			skipFiles = { 'node_modules/**' },
			console = 'integratedTerminal',
		},
	},
}
