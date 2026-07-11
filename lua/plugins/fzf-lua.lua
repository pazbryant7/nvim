return {
	'ibhagwan/fzf-lua',
	cmd = { 'FzfLua' },

	opts = function()
		local actions = require('fzf-lua.actions')
		local path = require('fzf-lua.path')

		local fmts = { 'png', 'jpg', 'jpeg', 'gif', 'webp', 'svg' }

		local extensions = {}
		for _, ext in ipairs(fmts) do
			extensions[ext] = { 'chafa', '{file}' }
		end

		local function on_list(opts)
			vim.fn.setqflist({}, ' ', opts)
			if #opts.items > 1 then
				require('quicker').open()
			end
			vim.cmd.cfirst()
		end

		local function set_to_qf(items, opts)
			return vim.tbl_map(function(entry)
				local file = path.entry_to_file(entry, opts)
				return {
					filename = file.path,
					lnum = file.line or 1,
					col = file.col or 1,
					text = entry,
				}
			end, items)
		end

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
					['enter'] = actions.file_edit_or_qf,
					['ctrl-s'] = actions.file_split,
					['ctrl-v'] = actions.file_vsplit,
					['ctrl-t'] = actions.file_tabedit,
					['ctrl-i'] = actions.toggle_ignore,
					['ctrl-f'] = actions.toggle_follow,
					['ctrl-h'] = actions.toggle_hidden,
					['ctrl-q'] = {
						fn = function(selected, opts)
							on_list({ title = 'FzfLua', items = set_to_qf(selected, opts) })
						end,
						prefix = 'select-all',
					},
				},
			},

			previewers = {
				builtin = { extensions = extensions },
			},

			files = { hidden = false },
			grep = { hidden = false },
			live_grep = { hidden = false },
		}
	end,

	config = function(_, opts)
		local fzf = require('fzf-lua')
		fzf.setup(opts)
		pcall(fzf.register_ui_select)
	end,

	keys = (function()
		local function fzf(method, picker_opts)
			return function()
				require('fzf-lua')[method](picker_opts)
			end
		end

		return {
			{ '<c-p>', fzf('files'), desc = 'Files' },
			{ '<leader>k', fzf('keymaps'), desc = 'Keymaps' },
			{ '<leader>b', fzf('buffers'), desc = 'Buffers' },
			{ '<leader>ht', fzf('help_tags'), desc = 'Help Tags' },
			{ '<c-t>', fzf('live_grep_native'), desc = 'Live Grep' },
			{ 'z=', fzf('spell_suggest'), desc = 'Spell Suggestions' },
			{ '<leader>s', fzf('lsp_document_symbols'), desc = 'Document Symbols' },
			{ '<leader>S', fzf('lsp_workspace_symbols'), desc = 'Workspace Symbols' },
			{
				'<m-p>',
				fzf('files', { cwd = vim.fn.expand('%:p:h') }),
				desc = 'Files (cwd of current file)',
			},
			{
				'<m-c>',
				fzf('files', {
					cmd = 'fd --type d',
					actions = {
						['default'] = function(selected)
							require('oil').open(selected[1])
						end,
					},
				}),
				desc = 'Directories',
			},
			{
				'<leader>th',
				fzf('colorschemes', {
					ignore_patterns = {
						'^ron$',
						'^vim$',
						'^blue$',
						'^delek$',
						'^quiet$',
						'^slate$',
						'^torte$',
						'^shine$',
						'^pablo$',
						'^dayfox$',
						'^desert$',
						'^murphy$',
						'^sorbet$',
						'^elflord$',
						'^koehler$',
						'^morning$',
						'^evening$',
						'^dawnfox$',
						'^zellner$',
						'^retrobox$',
						'^vimbones$',
						'^darkblue$',
						'^neobones$',
						'^industry$',
						'^zaibatsu$',
						'^rosebones$',
						'^nordbones$',
						'^wildcharm$',
						'^zenburned$',
						'^duckbones$',
						'^peachpuff$',
						'^seoulbones$',
						'^lunaperche$',
						'^tokyobones$',
						'^zenwritten$',
						'^forestbones$',
						'^randombones$',
						'^kanagawabones$',
						'^randombones_dark$',
						'^randombones_light$',
					},
				}),
				desc = 'Colorschemes',
			},
		}
	end)(),
}
