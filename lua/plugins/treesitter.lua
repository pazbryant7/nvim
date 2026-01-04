return {
	'nvim-treesitter/nvim-treesitter',
	event = 'BufReadPre',
	build = ':TSUpdate',
	branch = 'main',
	config = function()
		local parsers = {
			'go',
			'lua',
			'css',
			'tsx',
			'vim',
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
			'dockerfile',
			'typescript',
			'javascript',
			'editorconfig',
			'markdown_inline',
		}

		if vim.fn.executable('tree-sitter') == 1 then
			require('nvim-treesitter').install(parsers)
		end

		vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.wo.foldmethod = 'expr'

		local opts = {
			no_indent = { 'bash', 'markdown', 'sh' },
			no_highlight = { 'checkhealth', 'lazy', 'mason' },
		}

		vim.api.nvim_create_autocmd('FileType', {
			desc = 'Configure treesitter highlighting and indentation',
			group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true }),
			callback = function(ctx)
				local lang = vim.treesitter.language.get_lang(ctx.match) or ctx.match

				if not vim.list_contains(opts.no_highlight, lang) then
					pcall(vim.treesitter.start, ctx.buf, lang)
				end

				if not vim.list_contains(opts.no_indent, lang) then
					vim.bo[ctx.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
