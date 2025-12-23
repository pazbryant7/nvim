local v = vim

local map = v.keymap.set

-- last buffer
map('i', '<C-^>', '<Cmd>b#<CR>', { desc = 'Toggle Between Current And Last Buffer' })

-- grep word under cursor
map('n', '<c-c>', function()
	vim.cmd('grep! ' .. vim.fn.expand('<cword>'))
end)

-- In Visual mode, moves the selected lines down and up by one line, then re-indents.
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Selected Lines Down', silent = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Selected Lines Up', silent = true })

-- In Normal mode, joins the line below to the current line, but keeps the cursor in its original column.
map('n', 'J', 'mzJ`z', { desc = 'Join Line Below (Preserve Cursor Position)' })

-- swap maps
map({ 'n', 'v' }, ';', ':', { desc = 'Enter Command Mode' })
map({ 'n', 'v' }, ':', ';', { desc = 'Repeat Last F/T/F/T Search' })

-- Better neovim defaults
map('n', 'n', 'nzzzv', { desc = 'Next Search Result And Center' })
map('n', 'N', 'Nzzzv', { desc = 'Previous Search Result And Center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll Up And Re-Center View' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down And Re-Center View' })
map('n', '<C-i>', '<C-i>zz', { desc = 'Jump Forward To Next Position And Center' })
map('n', '<C-o>', '<C-o>zz', { desc = 'Jump Back To Previous Position And Center' })

--  No highlights
map('n', '<Escape>', '<cmd>noh<CR>', { desc = 'No Search Highlights' })

-- paste without overwriting registers
map({ 'n', 'v' }, '<leader>p', '"0p', { desc = 'Paste (keep registers)' })
map({ 'n', 'v' }, '<leader>P', '"0P', { desc = 'Paste before (keep registers)' })

-- yank to system clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
map('n', '<leader>Y', '"+Y', { desc = 'Yank line to clipboard' })

-- delete without overwriting registers
map({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete (black-hole register)' })
map('n', '<leader>D', '"_D', { desc = 'Delete line (black-hole register)' })

-- align manually
map('v', '<', '<gv', { desc = 'Align Items To The Left' })
map('v', '>', '>gv', { desc = 'Align Items To The Right' })

-- custom rename
map('n', 'gcr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Custom Rename' })

-- print current path
map('n', 'gcp', function()
	vim.notify(vim.fn.expand('%:p'), vim.log.levels.INFO, { title = 'Neovim Alert' })
end, { desc = 'Print Current Path' })

-- exit
map('n', 'ZQ', ':q!<CR>', { desc = 'Quit Without Saving' })
map('n', 'ZZ', ':wq<CR>', { desc = 'Save And Quit' })

-- navigate quickfix list without "no more items" errors
map('n', '<c-k>', '<cmd>silent! cnext<CR>zz', { desc = 'Quickfix: Next Item' })
map('n', '<c-j>', '<cmd>silent! cprevious<CR>zz', { desc = 'Quickfix: Previous Item' })

-- usercmd keybinds
map('n', '<leader>ts', '<cmd>ToggleSpell<cr>', { desc = 'Toggle Spell' })

map('n', '<leader>td', '<cmd>ToggleDiagnostics<cr>', { desc = 'Toggle Diagnostics' })

-- tmux open under cursor in new tmux pane
map('n', '<leader>gf', '<cmd>GoToFileWithTumux<cr>', {
	noremap = true,
	silent = true,
	desc = 'Open File Under Cursor In New Tmux Pane',
})
