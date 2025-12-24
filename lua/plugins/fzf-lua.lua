return {
	'ibhagwan/fzf-lua',
	opts = function()
		local actions = require('fzf-lua.actions')

		return {
			winopts = {
				height = 0.60,
				width = 0.60,
				preview = {
					hidden = true,
					layout = 'flex',
				},
			},

			keymap = {
				builtin = {
					false,
					['<F1>'] = 'toggle-help',
					['<F2>'] = 'toggle-fullscreen',
					['<F3>'] = 'toggle-preview',
					['<c-d>'] = 'preview-page-down',
					['<c-u>'] = 'preview-page-up',
				},
				fzf = {
					false,
					['ctrl-a'] = 'beginning-of-line',
					['ctrl-e'] = 'end-of-line',
				},
			},
			actions = {
				files = {
					false,
					['ctrl-s'] = actions.file_split,
					['ctrl-v'] = actions.file_vsplit,
					['ctrl-t'] = actions.file_tabedit,
					['ctrl-i'] = actions.toggle_ignore,
					['ctrl-f'] = actions.toggle_follow,
					['ctrl-h'] = actions.toggle_hidden,
					['enter'] = actions.file_edit_or_qf,
					['ctrl-q'] = {
						fn = function(selected, opts)
							opts.copen = false
							actions.file_sel_to_qf(selected, opts)
						end,
						prefix = 'select-all',
					},
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
	config = function(_, opts)
		require('fzf-lua').setup(opts)

		pcall(function()
			require('fzf-lua').register_ui_select()
		end)
	end,

	keys = {
		{
			'<c-p>',
			function()
				require('fzf-lua').files()
			end,
			desc = 'FzfLua Files',
		},
		{
			'<leader>ht',
			function()
				require('fzf-lua').help_tags()
			end,
			desc = 'FzfLua Help Tags',
		},
		{
			'<m-c>',
			function()
				require('fzf-lua').files({
					prompt = 'cd> ',
					cmd = 'fd --type d --hidden --exclude .git',
				})
			end,
			desc = 'FzfLua Files',
		},
		{
			'<leader>b',
			function()
				require('fzf-lua').buffers()
			end,
			desc = 'FzfLua buffers',
		},
		{
			'<leader>k',
			function()
				require('fzf-lua').keymaps()
			end,
			desc = 'FzfLua Show Key Maps',
		},
		{
			'<c-t>',
			function()
				require('fzf-lua').live_grep_native()
			end,
			desc = 'FzfLua Live Grep',
		},
		{
			'z=',
			function()
				require('fzf-lua').spell_suggest()
			end,
			desc = 'FzfLua Spell Suggestions',
		},
		{
			'<leader>wt',
			function()
				require('fzf-lua').git_worktrees()
			end,
			desc = 'FzfLua WorkTrees',
		},
		{
			'<m-p>',
			function()
				require('fzf-lua').files({ cwd = vim.fn.expand('%:p:h') })
			end,
			desc = "FzfLua Files from Current File's Directory",
		},
		{
			'<leader>th',
			function()
				require('fzf-lua').colorschemes({
					ignore_patterns = {
						'^ron$',
						'^vim$',
						'^blue$',
						'^delek$',
						'^torte$',
						'^slate$',
						'^pablo$',
						'^quiet$',
						'^shine$',
						'^murphy$',
						'^sorbet$',
						'^dayfox$',
						'^morning$',
						'^koehler$',
						'^elflord$',
						'^zellner$',
						'^dawnfox$',
						'^retrobox$',
						'^zaibatsu$',
						'^industry$',
						'^darkblue$',
						'^wildcharm$',
						'^peachpuff$',
						'^catppuccin$',
						'^lunaperche$',
						'^catppuccin%-latte$',
					},
				})
			end,
			desc = 'FzfLua Switch Colorschemes',
		},
	},
}
