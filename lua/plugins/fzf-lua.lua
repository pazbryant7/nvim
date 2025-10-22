return {
	'ibhagwan/fzf-lua',
	opts = function()
		local actions = require('fzf-lua').actions

		return {
			profile = {
				enabled = true,
				default = 'max-perf',
			},
			winopts = {
				height = 0.60,
				width = 0.60,
				preview = {
					hidden = false,
				},
			},
			keymap = {
				builtin = {
					false,
					['<F4>'] = 'toggle-preview',
					['<c-d>'] = 'preview-page-down',
					['<c-u>'] = 'preview-page-up',
				},
				fzf = {
					false,
					['ctrl-a'] = 'beginning-of-line',
					['ctrl-e'] = 'end-of-line',
					['ctrl-g'] = 'first',
					['ctrl-G'] = 'last',
					['f4'] = 'toggle-preview',
					['ctrl-d'] = 'preview-page-down',
					['ctrl-u'] = 'preview-page-up',
				},
			},
			actions = {
				files = {
					true,
					['ctrl-t'] = { fn = actions.file_tabedit },
					['ctrl-q'] = { fn = actions.file_sel_to_qf, prefix = 'select-all' },
				},
			},
			previewers = {
				builtin = {
					extensions = {
						['png'] = { 'chafa', '{file}' },
						['jpg'] = { 'chafa', '{file}' },
						['jpeg'] = { 'chafa', '{file}' },
						['gif'] = { 'chafa', '{file}' },
						['webp'] = { 'chafa', '{file}' },
						['svg'] = { 'chafa', '{file}' },
					},
				},
			},
			files = {
				hidden = false,
			},
			grep = {
				hidden = false,
			},
			live_grep = { hidden = false },
		}
	end,

	keys = {
		-- stylua: ignore start
		{ '<leader>f', '<cmd> FzfLua <CR>', desc = 'FzfLua' },
		{ '<c-p>', function() require('fzf-lua').files() end, desc = 'FzfLua Files' },
		{ '<c-f>', function() require('fzf-lua').buffers() end, desc = 'FzfLua buffers' },
		{ '<leader>H', function() require('fzf-lua').help_tags() end, desc = 'FzfLua Help Tags' },
		{ '<leader>k', function() require('fzf-lua').keymaps() end, desc = 'FzfLua Show Key Maps' },
		{ '<c-t>', function() require('fzf-lua').live_grep_native() end, desc = 'FzfLua Live Grep' },
		{ 'z=', function() require('fzf-lua').spell_suggest() end, desc = 'FzfLua Spell Suggestions' },
		{ '<leader>wt', function() require('fzf-lua').git_worktrees() end, desc = "FzfLua WorkTrees", },
		{ '<leader>s', function() require('fzf-lua').lsp_document_symbols() end, desc = 'FzfLua Lsp Document Symbols' },
		{ '<leader>ws', function() require('fzf-lua').lsp_workspace_symbols() end, desc = 'FzfLua Lsp Workspace Symbols' },
		{ '<m-c>', function() require('fzf-lua').files({ cwd = vim.fn.expand('%:p:h') }) end, desc = "FzfLua Files from Current File's Directory", },
		-- stylua: ignore end
		{
			'<leader>th',
			function()
				require('fzf-lua').colorschemes({
					ignore_patterns = {
						'^ron$',
						'^vim$',
						'^blue$',
						'^shine$',
						'^slate$',
						'^torte$',
						'^quiet$',
						'^pablo$',
						'^delek$',
						'^desert$',
						'^murphy$',
						'^sorbet$',
						'^zellner$',
						'^elflord$',
						'^koehler$',
						'^morning$',
						'^evening$',
						'^darkblue$',
						'^industry$',
						'^retrobox$',
						'^zaibatsu$',
						'^peachpuff$',
						'^wildcharm$',
						'^lunaperche$',
					},
				})
			end,
			desc = 'FzfLua Switch Colorschemes',
		},
	},
}
