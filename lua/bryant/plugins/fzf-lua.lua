return {
	'ibhagwan/fzf-lua',
	opts = function()
		local actions = require('fzf-lua').actions
		local file_ignore_patterns = {
			'tags',
			'*.pyc',
			'mocks',
			'go.mod',
			'dist/',
			'go.sum',
			'build/',
			'zig-out',
			'.docker',
			'vendor/',
			'target/',
			'yarn.lock',
			'zig-cache',
			'refactoring',
			'__pycache__',
			'node_modules/',
			'lazy%-lock%.json$',
			'package%-lock%.json$',
		}

		return {
			profile = {
				enabled = true,
				default = 'max-perf',
			},
			winopts = {
				height = 0.70,
				width = 0.70,
			},
			file_ignore_patterns = file_ignore_patterns,
			actions = {
				files = {
					['ctrl-s'] = actions.file_split,
					['ctrl-v'] = actions.file_vsplit,
					['enter'] = actions.file_edit_or_qf,
					['ctrl-q'] = { fn = actions.file_sel_to_qf, prefix = 'select-all' },
					['ctrl-h'] = actions.toggle_hidden,
					['ctrl-i'] = actions.toggle_ignore,
				},
				grep = {
					['ctrl-h'] = actions.toggle_hidden,
					['ctrl-i'] = actions.toggle_ignore,
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
				hidden = true,
				fd_opts = '--color=never --type f',
			},
			grep = {
				rg_opts = '--column --line-number --no-heading --color=always --smart-case',
			},
			live_grep = {
				hidden = true,
				rg_opts = '--column --line-number --no-heading --color=always --smart-case',
			},
		}
	end,
	-- stylua: ignore start
	keys = {
		{ '<leader>fz', "<cmd> FzfLua <CR>" , desc = 'FzfLua' },
		{ '<c-p>', function() require('fzf-lua').files() end, desc = 'FzfLua Files' },
		{ '<leader>ht', function() require('fzf-lua').help_tags() end, desc = 'FzfLua Help Tags' },
		{ '<leader>k', function() require('fzf-lua').keymaps() end, desc = 'FzfLua Show Key Maps' },
		{ '<c-t>', function() require('fzf-lua').live_grep_native() end, desc = 'FzfLua Live Grep' },
		{ 'z=', function() require('fzf-lua').spell_suggest() end, desc = 'FzfLua Spell Suggestions' },
		{ '<leader>th', function() require('fzf-lua').colorschemes() end, desc = 'FzfLua Switch Colorschemes' },
		{ '<leader>ds', function() require("fzf-lua").lsp_document_symbols() end , desc = 'FzfLua document symbols' },
		{ '<leader>ws', function() require("fzf-lua").lsp_workspace_symbols() end , desc = 'FzfLua workspace symbols' },
	},
	-- stylua: ignore end
}
