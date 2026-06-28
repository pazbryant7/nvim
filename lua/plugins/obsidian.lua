local date_fmt = '%m-%d-%Y'
local time_fmt = '%H:%M'
local datetime_fmt = date_fmt .. ' ' .. time_fmt
local alias_fmt = '%B %-d, %Y'

local function generate_note_id(title)
	local suffix = ''
	if title and title ~= '' then
		suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower():sub(1, 30)
	else
		for _ = 1, 4 do
			suffix = suffix .. string.char(math.random(97, 122))
		end
	end
	return os.date('%Y%m%d%H%M') .. '-' .. suffix
end

local function new_obsidian_note(template_name)
	local title = vim.fn.input('Note title: ')
	if title ~= '' and template_name ~= '' then
		vim.cmd('Obsidian new_from_template ' .. title .. ' ' .. template_name)
	else
		print('Error: A title and template name must be provided.')
	end
end

return {
	'obsidian-nvim/obsidian.nvim',
	dependencies = {
		'ibhagwan/fzf-lua',
		'nvim-lua/plenary.nvim',
	},
	event = (function()
		local roots = {
			vim.fn.expand('~') .. '/Documents/github/notes/**',
			vim.fn.expand('~') .. '/Documents/github/youtube/**',
		}
		local events = {}
		for _, root in ipairs(roots) do
			events[#events + 1] = 'BufReadPre ' .. root
			events[#events + 1] = 'BufNewFile ' .. root
		end
		return events
	end)(),
	cmd = { 'Obsidian' },
	opts = {
		legacy_commands = false,

		workspaces = {
			{ name = 'Personal notes', path = '~/Documents/github/notes' },
			{ name = 'Youtube Notes', path = '~/Documents/github/youtube' },
		},

		daily_notes = {
			workdays_only = false,
			date_format = date_fmt,
			folder = '01-Dailynotes',
			alias_format = alias_fmt,
			default_tags = { 'Daily-notes' },
			template = '30-Templates/Daily.md',
		},

		completion = {
			min_chars = 2,
			match_case = true,
			create_new = true,
		},

		new_notes_location = 'current_dir',

		link = {
			style = 'wiki',
			format = 'shortest',
			auto_update = false,
		},

		templates = {
			folder = '30-Templates',
			date_format = date_fmt,
			time_format = time_fmt,
			substitutions = {
				id = function(_)
					return generate_note_id()
				end,
				id_with_title = function(_, suffix)
					return generate_note_id(suffix)
				end,
				date = function(_, suffix)
					return os.date(suffix or date_fmt)
				end,
				time = function(_, suffix)
					return os.date(suffix or time_fmt)
				end,
			},
			customizations = (function()
				local map = {
					fleeting = '00-Fleeting',
					literature = '10-Literature',
					permanent = '20-Zettelkasten',
				}
				local out = {}
				for name, dir in pairs(map) do
					out[name] = { notes_subdir = dir, note_id_func = generate_note_id }
				end
				return out
			end)(),
		},

		note_id_func = generate_note_id,

		note_path_func = function(spec)
			return (spec.dir / tostring(spec.id)):with_suffix('.md', true)
		end,

		frontmatter = {
			enabled = true,
			func = function(note)
				if note.title then
					note:add_alias(note.title)
				end
				local out = {
					id = note.id,
					aliases = note.aliases,
					tags = note.tags,
					created = (note.metadata and note.metadata.created) or os.date(datetime_fmt),
					modified = os.date(datetime_fmt),
					connections = {},
				}
				if note.metadata and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end
				return out
			end,
		},

		open = {
			use_advanced_uri = true,
			func = vim.ui.open,
		},

		picker = {
			name = 'fzf-lua',
			note_mappings = { new = '<C-x>', insert_link = '<C-l>' },
			tag_mappings = { tag_note = '<C-x>', insert_tag = '<C-l>' },
		},

		search = {
			max_lines = 1000,
			sort_by = 'modified',
			sort_reversed = true,
		},

		open_notes_in = 'current',
		ui = { enable = true },

		attachments = {
			folder = '50-Assets/imgs/',
			img_name_func = function()
				return string.format('img-%s-', os.date('%Y%m%d-%H%M%S'))
			end,
			img_text_func = function(path)
				local name = vim.fs.basename(tostring(path))
				local encoded_name = require('obsidian.util').urlencode(name)
				local custom_name = name:match('img%-%d+%-%d+%-(.+)%.%w+$') or name
				return string.format('![%s](assets/imgs/%s)', custom_name, encoded_name)
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
			order = { ' ', 'x', '~' },
		},
	},

	keys = {
		-- Core navigation
		{ '<leader>oo', '<cmd>Obsidian<CR>', desc = 'Obsidian Open' },
		{ '<leader>os', '<cmd>Obsidian quick_switch<CR>', desc = 'Obsidian Quick Switch' },
		{ '<leader>oS', '<cmd>Obsidian search<CR>', desc = 'Obsidian Search' },
		{ '<leader>oW', '<cmd>Obsidian workspace<CR>', desc = 'Obsidian Switch Workspace' },

		-- Daily notes
		{ '<leader>ot', '<cmd>Obsidian today<CR>', desc = 'Obsidian Today' },
		{ '<leader>oy', '<cmd>Obsidian yesterday<CR>', desc = 'Obsidian Yesterday' },
		{ '<leader>od', '<cmd>Obsidian dailies<CR>', desc = 'Obsidian Dailies List' },

		-- Note actions
		{ '<leader>on', '<cmd>Obsidian new<CR>', desc = 'Obsidian New Note' },
		{ '<leader>or', '<cmd>Obsidian rename<CR>', desc = 'Obsidian Rename Note' },
		{ '<leader>ob', '<cmd>Obsidian backlinks<CR>', desc = 'Obsidian Show Backlinks' },
		{ '<leader>oc', '<cmd>Obsidian toc<CR>', desc = 'Obsidian Table of Contents' },
		{ '<leader>of', '<cmd>Obsidian follow_link<CR>', desc = 'Obsidian Follow Link' },
		{ '<leader>ok', '<cmd>Obsidian check<CR>', desc = 'Obsidian Check Vault' },
		{ '<leader>og', '<cmd>Obsidian tags<CR>', desc = 'Obsidian Search Tags' },

		-- Templates
		{ '<leader>oT', '<cmd>Obsidian template<CR>', desc = 'Obsidian Insert Template' },
		{ '<leader>ou', '<cmd>Obsidian unique_note<CR>', desc = 'Obsidian Unique Note' },

		-- New notes (Zettelkasten)
		{
			'<leader>zf',
			function()
				new_obsidian_note('Fleeting')
			end,
			desc = 'Obsidian New Fleeting Note',
		},
		{
			'<leader>zp',
			function()
				new_obsidian_note('Permanent')
			end,
			desc = 'Obsidian New Permanent Note',
		},
		{
			'<leader>zl',
			function()
				new_obsidian_note('Literature')
			end,
			desc = 'Obsidian New Literature Note',
		},

		-- Images
		{ '<leader>op', '<cmd>Obsidian paste_img<CR>', desc = 'Obsidian Paste Image' },
	},
}
