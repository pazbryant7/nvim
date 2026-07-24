-- ── shared config ──────────────────────────────────────────────
local DATE_FMT = '%m-%d-%Y'
local TIME_FMT = '%H:%M'
local DATETIME_FMT = DATE_FMT .. ' ' .. TIME_FMT
local ALIAS_FMT = '%B %-d, %Y'

local NOTES_DIR = '~/Documents/github/notes'
local YT_DIR = '~/Documents/github/youtube'

local ASSETS_DIR = '60-Assets/imgs'
local TEMPLATES_DIR = '40-Templates'
local DAILY_DIR = '01-Dailynotes'
local DAILY_TEMPLATE = TEMPLATES_DIR .. '/Daily.md'

local ZETTEL_DIRS = {
	fleeting = '00-Fleeting',
	literature = '10-Literature',
	permanent = '20-Zettelkasten',
}

local function gen_id(title)
	local suffix
	if title and title ~= '' then
		suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower():sub(1, 30)
	end
	if not suffix or suffix == '' then
		suffix = ''
		for _ = 1, 4 do
			suffix = suffix .. string.char(math.random(97, 122))
		end
	end
	return os.date('%Y%m%d%H%M') .. '-' .. suffix
end

local function new_note(template)
	local title = vim.fn.input('Note title: ')
	if title == '' or template == '' then
		return print('Error: A title and template name must be provided.')
	end
	vim.cmd('Obsidian new_from_template ' .. title .. ' ' .. template)
end

local function zettel_customizations()
	local out = {}
	for name, dir in pairs(ZETTEL_DIRS) do
		out[name] = { notes_subdir = dir, note_id_func = gen_id }
	end
	return out
end

return {
	'obsidian-nvim/obsidian.nvim',
	dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
	event = (function()
		local events = {}
		for _, root in ipairs({ NOTES_DIR, YT_DIR }) do
			local path = vim.fn.expand(root) .. '/**'
			events[#events + 1] = 'BufReadPre ' .. path
			events[#events + 1] = 'BufNewFile ' .. path
		end
		return events
	end)(),
	cmd = { 'Obsidian' },
	opts = {
		legacy_commands = false,

		workspaces = {
			{ name = 'Personal notes', path = NOTES_DIR },
			{ name = 'Youtube Notes', path = YT_DIR },
		},

		daily_notes = {
			workdays_only = false,
			date_format = DATE_FMT,
			folder = DAILY_DIR,
			alias_format = ALIAS_FMT,
			default_tags = { 'Daily-notes' },
			template = DAILY_TEMPLATE,
		},

		completion = { min_chars = 2, match_case = true, create_new = true },

		new_notes_location = 'current_dir',

		link = { style = 'wiki', format = 'shortest', auto_update = false },

		templates = {
			folder = TEMPLATES_DIR,
			date_format = DATE_FMT,
			time_format = TIME_FMT,
			substitutions = {
				id = function(_)
					return gen_id()
				end,
				id_with_title = function(_, suffix)
					return gen_id(suffix)
				end,
				date = function(_, suffix)
					return os.date(suffix or DATE_FMT)
				end,
				time = function(_, suffix)
					return os.date(suffix or TIME_FMT)
				end,
			},
			customizations = zettel_customizations(),
		},

		note_id_func = gen_id,

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
					created = (note.metadata and note.metadata.created) or os.date(DATETIME_FMT),
					modified = os.date(DATETIME_FMT),
					connections = {},
				}
				for k, v in pairs(note.metadata or {}) do
					out[k] = v
				end
				return out
			end,
		},

		open = { use_advanced_uri = true, func = vim.ui.open },

		picker = {
			name = 'fzf-lua',
			note_mappings = { new = '<C-x>', insert_link = '<C-l>' },
			tag_mappings = { tag_note = '<C-x>', insert_tag = '<C-l>' },
		},

		search = { max_lines = 1000, sort_by = 'modified', sort_reversed = true },

		open_notes_in = 'current',
		ui = { enable = true },

		attachments = {
			folder = ASSETS_DIR,
			img_name_func = function()
				return string.format('img-%s-', os.date('%Y%m%d-%H%M%S'))
			end,
			img_text_func = function(path)
				local util = require('obsidian.util')
				local name = vim.fs.basename(tostring(path))
				local custom_name = name:match('img%-%d+%-%d+%-(.+)%.%w+$') or name
				return string.format('![%s](%s/%s)', custom_name, ASSETS_DIR, util.urlencode(name))
			end,
			confirm_img_paste = true,
		},

		footer = {
			enabled = true,
			format = '{{backlinks}} backlinks  {{properties}} properties  {{words}} words  {{chars}} chars',
			hl_group = 'Comment',
			separator = string.rep('-', 80),
		},

		checkbox = { order = { ' ', 'x', '~' } },
	},

	keys = {
		{ '<leader>oo', '<cmd>Obsidian<CR>', desc = 'Obsidian Open' },
		{ '<leader>os', '<cmd>Obsidian quick_switch<CR>', desc = 'Obsidian Quick Switch' },
		{ '<leader>oS', '<cmd>Obsidian search<CR>', desc = 'Obsidian Search' },
		{ '<leader>oW', '<cmd>Obsidian workspace<CR>', desc = 'Obsidian Switch Workspace' },

		{ '<leader>ot', '<cmd>Obsidian today<CR>', desc = 'Obsidian Today' },
		{ '<leader>oy', '<cmd>Obsidian yesterday<CR>', desc = 'Obsidian Yesterday' },
		{ '<leader>od', '<cmd>Obsidian dailies<CR>', desc = 'Obsidian Dailies List' },

		{ '<leader>or', '<cmd>Obsidian rename<CR>', desc = 'Obsidian Rename Note' },
		{ '<leader>ob', '<cmd>Obsidian backlinks<CR>', desc = 'Obsidian Show Backlinks' },
		{ '<leader>oc', '<cmd>Obsidian toc<CR>', desc = 'Obsidian Table of Contents' },
		{ '<leader>of', '<cmd>Obsidian follow_link<CR>', desc = 'Obsidian Follow Link' },
		{ '<leader>ok', '<cmd>Obsidian check<CR>', desc = 'Obsidian Check Vault' },
		{ '<leader>og', '<cmd>Obsidian tags<CR>', desc = 'Obsidian Search Tags' },

		{ '<leader>oT', '<cmd>Obsidian template<CR>', desc = 'Obsidian Insert Template' },
		{ '<leader>ou', '<cmd>Obsidian unique_note<CR>', desc = 'Obsidian Unique Note' },

		{ '<leader>on', '<cmd>Obsidian new<CR>', desc = 'Obsidian New Note' },
		{
			'<leader>zf',
			function()
				new_note('Fleeting')
			end,
			desc = 'Obsidian New Fleeting Note',
		},
		{
			'<leader>zp',
			function()
				new_note('Permanent')
			end,
			desc = 'Obsidian New Permanent Note',
		},
		{
			'<leader>zl',
			function()
				new_note('Literature')
			end,
			desc = 'Obsidian New Literature Note',
		},

		{ '<leader>op', '<cmd>Obsidian paste_img<CR>', desc = 'Obsidian Paste Image' },
	},
}
