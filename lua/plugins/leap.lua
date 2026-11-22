return {
	'https://codeberg.org/andyg/leap.nvim',
	keys = {
		{ 's', '<Plug>(leap)', mode = { 'n', 'x', 'o' }, desc = 'Leap' },
		{ 'x', '<Plug>(leap-next-to)', mode = { 'x', 'o' }, desc = 'Leap Next To' },
		{ 'S', '<Plug>(leap-from-window)', mode = 'n', desc = 'Leap From Window' },
		{ 'f', mode = { 'n', 'x', 'o' }, desc = 'Leap Find' },
		{ 'F', mode = { 'n', 'x', 'o' }, desc = 'Leap Find Backward' },
		{ 't', mode = { 'n', 'x', 'o' }, desc = 'Leap Till' },
		{ 'T', mode = { 'n', 'x', 'o' }, desc = 'Leap Till Backward' },
	},
	config = function()
		local leap = require('leap')

		local function set_highlights()
			vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'None' })
			vim.api.nvim_set_hl(0, 'LeapLabel', { link = 'IncSearch' })
			leap.init_hl()
		end

		leap.opts.on_beacons = function(targets)
			for _, target in ipairs(targets) do
				if target.label and target.beacon then
					local virt_text = target.beacon[2].virt_text
					if virt_text then
						virt_text[1][1] = target.label:upper()
					end
				end
			end
		end

		set_highlights()
		vim.api.nvim_create_autocmd('ColorScheme', {
			group = vim.api.nvim_create_augroup('LeapHighlights', { clear = true }),
			callback = set_highlights,
		})

		local function ft(kwargs)
			leap.leap(vim.tbl_deep_extend('keep', kwargs, {
				inputlen = 1,
				inclusive = true,
				opts = {
					labels = '',
					safe_labels = vim.fn.mode(1):match('no?') and '' or nil,
				},
			}))
		end

		local clever = require('leap.user').with_traversal_keys
		local clever_f, clever_t = clever('f', 'F'), clever('t', 'T')

		vim.keymap.set({ 'n', 'x', 'o' }, 'f', function()
			ft({ opts = clever_f })
		end, { desc = 'Leap Find' })
		vim.keymap.set({ 'n', 'x', 'o' }, 'F', function()
			ft({ backward = true, opts = clever_f })
		end, { desc = 'Leap Find Backward' })
		vim.keymap.set({ 'n', 'x', 'o' }, 't', function()
			ft({ offset = -1, opts = clever_t })
		end, { desc = 'Leap Till' })
		vim.keymap.set({ 'n', 'x', 'o' }, 'T', function()
			ft({ backward = true, offset = 1, opts = clever_t })
		end, { desc = 'Leap Till Backward' })
	end,
}
