local v = vim

local map = v.keymap.set
local clear_ui =
	'<Cmd>nohlsearch<Bar>diffupdate<Bar>call nvim_buf_clear_namespace(0, nvim_create_namespace("nvim.multicursor"), 0, -1)<Bar>normal! <C-L><CR>'

local function command(opts)
	local ok, err = pcall(v.api.nvim_cmd, opts, {})
	if not ok then
		v.notify(tostring(err), v.log.levels.ERROR)
	end
end

-- UI
map('n', '<c-l>', clear_ui, { desc = 'Clear UI state' })
map('n', '<esc>', clear_ui, { desc = 'Clear UI state' })

-- LSP
map('n', 'grn', v.lsp.buf.rename, { desc = 'LSP Rename' })
map('n', 'grr', v.lsp.buf.references, { desc = 'LSP References' })

map('n', 'gri', v.lsp.buf.implementation, { desc = 'LSP Implementation' })
map('n', 'grt', v.lsp.buf.type_definition, { desc = 'LSP Type Definition' })

map({ 'n', 'x' }, 'gra', v.lsp.buf.code_action, { desc = 'LSP Code Action' })
map('n', 'grx', v.lsp.codelens.run, { desc = 'LSP CodeLens' })

map('n', 'gO', v.lsp.buf.document_symbol, { desc = 'LSP Document Symbols' })
map({ 'i', 's' }, '<c-s>', v.lsp.buf.signature_help, { desc = 'LSP Signature Help' })

-- Diagnostics
map('n', ']d', function()
	v.diagnostic.jump({ count = v.v.count1 })
end, { desc = 'Next diagnostic' })

map('n', '[d', function()
	v.diagnostic.jump({ count = -v.v.count1 })
end, { desc = 'Previous diagnostic' })

map('n', ']D', function()
	v.diagnostic.jump({ count = math.max(#v.diagnostic.get(0), 1), wrap = false })
end, { desc = 'Last diagnostic' })

map('n', '[D', function()
	v.diagnostic.jump({ count = -math.max(#v.diagnostic.get(0), 1), wrap = false })
end, { desc = 'First diagnostic' })

map('n', '<c-w>d', v.diagnostic.open_float, { desc = 'Show diagnostics' })

-- Quickfix
map('n', '[q', function()
	command({ cmd = 'cprevious', count = v.v.count1 })
end, { desc = 'Previous quickfix' })

map('n', ']q', function()
	command({ cmd = 'cnext', count = v.v.count1 })
end, { desc = 'Next quickfix' })

map('n', '[Q', function()
	command({ cmd = 'crewind', count = v.v.count ~= 0 and v.v.count or nil })
end, { desc = 'First quickfix' })

map('n', ']Q', function()
	command({ cmd = 'clast', count = v.v.count ~= 0 and v.v.count or nil })
end, { desc = 'Last quickfix' })

-- Location list
map('n', '[l', function()
	command({ cmd = 'lprevious', count = v.v.count1 })
end, { desc = 'Previous location' })

map('n', ']l', function()
	command({ cmd = 'lnext', count = v.v.count1 })
end, { desc = 'Next location' })

-- Buffers
map('n', '[b', function()
	command({ cmd = 'bprevious', count = v.v.count1 })
end, { desc = 'Previous buffer' })

map('n', ']b', function()
	command({ cmd = 'bnext', count = v.v.count1 })
end, { desc = 'Next buffer' })

-- Tags
map('n', '[t', function()
	command({ cmd = 'tprevious', range = { v.v.count1 } })
end, { desc = 'Previous tag' })

map('n', ']t', function()
	command({ cmd = 'tnext', range = { v.v.count1 } })
end, { desc = 'Next tag' })

-- Arguments
map('n', '[a', function()
	command({ cmd = 'previous', count = v.v.count1 })
end, { desc = 'Previous argument' })

map('n', ']a', function()
	command({ cmd = 'next', range = { v.v.count1 } })
end, { desc = 'Next argument' })

-- Core-owned
-- gx opens links; [<Space> and ]<Space> add blank lines.
-- Multicursor: Q, q=, gQ, [C, ]C, g<C-a>, and <C-LeftMouse>.
-- zq is not available in this Neovim snapshot.

-- Buffers
map('i', '<c-^>', '<Cmd>b#<CR>', { desc = 'Toggle Between Current And Last Buffer' })

-- Visual lines
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Selected Lines Down', silent = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Selected Lines Up', silent = true })

-- Command mode
map({ 'n', 'v' }, ';', ':', { desc = 'Enter Command Mode' })
map({ 'n', 'v' }, ':', ';', { desc = 'Repeat Last F/T/F/T Search' })

-- Join
map('n', 'J', 'mzJ`z', { desc = 'Join Line Below (Preserve Cursor Position)' })

-- Navigation
map('n', 'n', 'nzzzv', { desc = 'Next Search Result And Center' })
map('n', 'N', 'Nzzzv', { desc = 'Previous Search Result And Center' })

map('n', '<c-u>', '<c-u>zz', { desc = 'Scroll Up And Re-Center View' })
map('n', '<c-d>', '<c-d>zz', { desc = 'Scroll Down And Re-Center View' })

map('n', '<c-i>', '<c-i>zz', { desc = 'Jump Forward To Next Position And Center' })
map('n', '<c-o>', '<c-o>zz', { desc = 'Jump Back To Previous Position And Center' })

-- Registers
map({ 'n', 'v' }, '<leader>p', '"0p', { desc = 'Paste (keep registers)' })
map({ 'n', 'v' }, '<leader>P', '"0P', { desc = 'Paste before (keep registers)' })

map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
map('n', '<leader>Y', '"+Y', { desc = 'Yank line to clipboard' })

map({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete (black-hole register)' })
map('n', '<leader>D', '"_D', { desc = 'Delete line (black-hole register)' })

-- Indent
map('v', '<', '<gv', { desc = 'Align Items To The Left' })
map('v', '>', '>gv', { desc = 'Align Items To The Right' })

-- Marks
map('n', '<leader>ms', '<cmd>marks<CR>', { desc = 'Show marks list' })
map('n', '<leader>md', '<cmd>delmarks! | delmarks A-Z<CR>', { desc = 'Delete all local and global marks' })

-- Rename
map('n', 'gcr', [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gI<Left><Left><Left>]], { desc = 'Custom Rename' })

-- Utilities
map('n', '<leader>cp', '<cmd>CurrentPath<cr>', { desc = 'Show and copy current path into the clipboard' })
map('n', '<leader>li', '<cmd>checkhealth vim.lsp<cr>', { desc = 'Lsp Info' })

-- Exit
map('n', '<leader>q', ':q!<CR>', { desc = 'Quit Without Saving' })
map('n', '<leader>Q', ':wq<CR>', { desc = 'Save And Quit' })

-- Quickfix
map('n', '<c-q>', '<cmd>ToggleQuickFixList<CR>', { desc = 'Toggle quickfix' })

-- Commands
map('n', '<leader>j', ':Jump ', { desc = 'Pre-fill :Jump command' })
map('n', '<leader>ts', '<cmd>SpellToggle<cr>', { desc = 'Toggle Spell' })
map('n', '<leader>rn', '<cmd>RenameFile<cr>', { desc = 'Rename current file' })
