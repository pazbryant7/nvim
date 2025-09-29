return {
	'obsidian-nvim/obsidian.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	version = '*',
	ft = 'markdown',
	cmd = { 'Obsidian' },
	opts = function()
		local function generate_note_id(title)
			local suffix = ''
			if title ~= nil and title ~= '' then
				suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
				if #suffix > 30 then
					suffix = suffix:sub(1, 30)
				end
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(97, 122)) -- lowercase
				end
			end
			return os.date('%Y%m%d%H%M') .. '-' .. suffix
		end

		return {
			legacy_commands = false,
			notes_subdir = '00 - Fleeting',

			workspaces = {
				{
					name = 'Personal notes',
					path = '~/Documents/github/notes',
				},
				{
					name = 'Youtube Notes',
					path = '~/Documents/github/youtube',
				},
			},

			daily_notes = {
				folder = '01 - Daily Notes',
				date_format = '%Y-%m-%d',
				alias_format = '%B %-d, %Y',
				default_tags = { 'daily-notes' },
				template = '40 - Templates/Daily.md',
				workdays_only = false,
			},

			completion = {
				nvim_cmp = false,
				blink = true,
				min_chars = 2,
				create_new = true,
			},

			new_notes_location = 'notes_subdir',

			templates = {
				folder = '40 - Templates',
				date_format = '%Y-%m-%d',
				time_format = '%H:%M',
				substitutions = {
					id = function()
						return generate_note_id()
					end,

					id_with_title = function(title)
						return generate_note_id(title)
					end,

					date = function()
						return os.date('%Y-%m-%d')
					end,
					time = function()
						return os.date('%H:%M')
					end,
				},
				customizations = {
					['Fleeting'] = {
						notes_subdir = '00 - Fleeting',
						note_id_func = generate_note_id,
					},
					['Literature'] = {
						notes_subdir = '10 - Literature',
						note_id_func = generate_note_id,
					},
					['Permanent'] = {
						notes_subdir = '20 - Zettelkasten',
						note_id_func = generate_note_id,
					},
				},
			},

			note_id_func = generate_note_id,

			note_path_func = function(spec)
				local path = spec.dir / tostring(spec.id)
				return path:with_suffix('.md')
			end,

			wiki_link_func = function(opts)
				return require('obsidian.util').wiki_link_id_prefix(opts)
			end,

			markdown_link_func = function(opts)
				return require('obsidian.util').markdown_link(opts)
			end,

			preferred_link_style = 'wiki',

			disable_frontmatter = false,

			note_frontmatter_func = function(note)
				if note.title then
					note:add_alias(note.title)
				end
				local out = {
					id = note.id,
					aliases = note.aliases,
					tags = note.tags,
					created = os.date('%Y-%m-%d %H:%M'),
					modified = os.date('%Y-%m-%d %H:%M'),
					connections = {},
				}
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end
				return out
			end,

			follow_url_func = function(url)
				vim.ui.open(url)
			end,

			follow_img_func = function(img)
				vim.ui.open(img)
			end,

			picker = {
				name = 'fzf-lua',
				note_mappings = {
					new = '<C-x>',
					insert_link = '<C-l>',
				},
				tag_mappings = {
					tag_note = '<C-x>',
					insert_tag = '<C-l>',
				},
			},

			sort_by = 'modified',
			sort_reversed = true,
			search_max_lines = 1000,
			open_notes_in = 'current',

			ui = {
				enable = false,
			},

			attachments = {
				img_folder = '30 - Attachments',
				img_name_func = function()
					return string.format('img-%s-', os.date('%Y%m%d-%H%M%S'))
				end,
				img_text_func = function(path)
					local name = vim.fs.basename(tostring(path))
					local encoded_name = require('obsidian.util').urlencode(name)

					local custom_name = name:match('img%-%d+%-%d+%-(.+)%.%w+$') or name
					local relative_path = string.format('Attachments/%s', encoded_name)
					return string.format('![%s](%s)', custom_name, relative_path)
				end,
				confirm_img_paste = true,
			},

			footer = {
				enabled = true,
				format = '{{backlinks}} backlinks  {{properties}} properties  {{words}} words  {{chars}} chars',
				hl_group = 'Comment',
				separator = string.rep('-', 80),
			},

			checkbox = {
				order = { ' ', 'x' },
			},
		}
	end,

	keys = function()
		local function new_obsidian_note(template_name)
			local title = vim.fn.input('Note tittle: ')
			if title and title ~= '' and template_name and template_name ~= '' then
				vim.cmd('Obsidian new_from_template ' .. title .. ' ' .. template_name)
			else
				print('Error: A title and template name must be provided.')
			end
		end

		return {
      -- stylua: ignore start
			{ '<leader>oo', '<cmd>Obsidian<CR>', desc = 'Obsidian open' },
			{ '<leader>ot', '<cmd>Obsidian today<CR>', desc = 'Obsidian today' },
			{ '<leader>oS', '<cmd>Obsidian search<CR>', desc = 'Obsidian search' },
			{ '<leader>og', '<cmd>Obsidian tags<CR>', desc = 'Obsidian search tags' },
			{ '<leader>or', '<cmd>Obsidian rename<CR>', desc = 'Obsidian rename note' },
			{ '<leader>oy', '<cmd>Obsidian yesterday<CR>', desc = 'Obsidian yesterday' },
			{ '<leader>oT', '<cmd>Obsidian template<CR>', desc = 'Obsidian insert template' },
			{ '<leader>ob', '<cmd>Obsidian backlinks<CR>', desc = 'Obsidian show backlinks' },
			{ '<leader>os', '<cmd>Obsidian quick_switch<CR>', desc = 'Obsidian quick switch' },

			-- New notes
			{ '<leader>zf', function() new_obsidian_note('Fleeting') end, desc = 'Obsidian insert fleeting note' },
			{ '<leader>zp', function() new_obsidian_note('Permanent') end, desc = 'Obsidian insert permanent note' },
			{ '<leader>zl', function() new_obsidian_note('Literature') end, desc = 'Obsidian insert literature note' },

			-- Image pasting and Search
			{ '<leader>op', '<cmd>Obsidian paste_img<CR>', desc = 'Obsidian paste image' },
			{ '<leader>zo', '<cmd>Obsidian open<CR>', desc = 'Obsidian open in obsidian app' },
		}
	end,
}
