return {
	'nvim-treesitter/nvim-treesitter',
	event = 'BufEnter',
	branch = 'master',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				'c',
				'go',
				'lua',
				'sql',
				'bash',
				'just',
				'rust',
				'jsdoc',
				'vimdoc',
				'markdown',
				'javascript',
				'typescript',
				'markdown_inline',
			},
			auto_install = true,
			additional_vim_regex_highlighting = false,
			incremental_selection = {
				enable = false,
			},
			indent = { enable = false },
			highlight = {
				enable = true,
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},
		})
	end,
}
