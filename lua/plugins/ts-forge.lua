return {
	'reybits/ts-forge.nvim',
	enabled = os.getenv('KATA') == nil,
	cmd = {
		'TSInstall',
		'TSUpdate',
	},
	event = 'BufReadPre',
	config = function()
		require('ts-forge').setup({
			auto_install = true,
			ensure_installed = {
				'lua',
				'css',
				'tsx',
				'vim',
				'cpp',
				'json',
				'html',
				'bash',
				'yaml',
				'regex',
				'python',
				'vimdoc',
				'markdown',
				'typescript',
				'javascript',
				'markdown_inline',
			},
		})
	end,
}
