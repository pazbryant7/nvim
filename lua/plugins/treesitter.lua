return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	branch = 'main',
	opts = {
		install_dir = vim.fn.stdpath('data') .. '/treesitter',
	},
	init = function()
		local ensureInstalled = {
			'go',
			'lua',
			'css',
			'tsx',
			'vim',
			'rust',
			'json',
			'html',
			'bash',
			'yaml',
			'regex',
			'luadoc',
			'python',
			'vimdoc',
			'comment',
			'markdown',
			'gitcommit',
			'typescript',
			'dockerfile',
			'javascript',
			'editorconfig',
			'markdown_inline',
		}

		local avoid_indent_in = { 'bash', 'markdown', 'javascript' }

		if vim.fn.executable('tree-sitter') == 1 then
			vim.defer_fn(function()
				require('nvim-treesitter').install(ensureInstalled)
			end, 1000)
		else
			vim.notify(
				'`tree-sitter-cli` not found. Skipping auto-install of parsers.',
				vim.log.levels.WARN,
				{ title = 'Treesitter' }
			)
		end

		vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.wo.foldmethod = 'expr'

		local autocmd = vim.api.nvim_create_autocmd

		autocmd('FileType', {
			desc = 'Enable treesitter highlighting and indentation',
			callback = function(ctx)
				pcall(vim.treesitter.start, ctx.buf)
				if not vim.list_contains(avoid_indent_in, ctx.match) then
					vim.bo[ctx.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})

		autocmd({ 'ColorScheme', 'VimEnter' }, {
			desc = 'Configure treesitter comment parser highlights',
			callback = function()
				vim.api.nvim_set_hl(0, '@lsp.type.comment', {})
				vim.api.nvim_set_hl(0, '@comment.bold', { bold = true })
			end,
		})
	end,
}
