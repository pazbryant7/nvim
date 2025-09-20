local v = vim

local map = v.keymap.set

-- last buffer
map('i', '<C-^>', '<Cmd>b#<CR>', { desc = 'Toggle between current and last buffer' })

-- Change inner word
map('n', '<C-c>', 'ciw', { desc = 'Change Inner Word' })

-- In Visual mode, moves the selected lines down and up by one line, then re-indents.
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down', silent = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up', silent = true })

-- In Normal mode, joins the line below to the current line, but keeps the cursor in its original column.
map('n', 'J', 'mzJ`z', { desc = 'Join line below (preserve cursor position)' })

-- swap maps
map({ 'n', 'v' }, ';', ':', { desc = 'Enter Command Mode' })
map({ 'n', 'v' }, ':', ';', { desc = 'Repeat last f/t/F/T search' })

-- Better neovim defaults
map('n', 'n', 'nzzzv', { desc = 'Next search result and center' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result and center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and re-center view' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and re-center view' })
map('n', '<C-i>', '<C-i>zz', { desc = 'Jump forward to next position and center' })
map('n', '<C-o>', '<C-o>zz', { desc = 'Jump back to previous position and center' })

--  No highlights
map('n', '<Escape>', '<cmd>noh<CR>', { desc = 'No search highlights' })

-- movement left and right
map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Go To The Start Of The Line' })
map({ 'n', 'v', 'o' }, 'L', 'g_', { desc = 'Go To The End Of The Line' })

-- without overwrite register
map('x', '<leader>P', [["_dP]], { desc = 'Paste Without Overwrite Register ' })

-- copy without overwrite register
map({ 'n', 'v' }, '<leader>Y', [["+y]], { desc = 'Copy Without Overwrite Register' })

-- delete without overwrite register
map({ 'n', 'v' }, '<leader>D', '"_d', { desc = 'Delete Without Overwrite Register' })

-- align manually
map('v', '<', '<gv', { desc = 'Align Items To The Left' })
map('v', '>', '>gv', { desc = 'Align Items To The Right' })

-- custom rename
map('n', '<leader>cr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Custom Rename' })

-- print current path
map('n', '<leader>cp', function()
	vim.notify(vim.fn.expand('%:p'), vim.log.levels.INFO, { title = 'Neovim Alert' })
end, { desc = 'Print Current Path' })

-- exit
map('n', 'ZQ', ':q!<CR>', { desc = 'Quit without saving' })
map('n', 'ZZ', ':wq<CR>', { desc = 'Save and quit' })

-- navigate quickfix list without "no more items" errors
map('n', '<c-k>', '<cmd>silent! cnext<CR>zz', { desc = 'Quickfix: Next item' })
map('n', '<c-j>', '<cmd>silent! cprevious<CR>zz', { desc = 'Quickfix: Previous item' })

-- usercmd keybinds
map('n', '<leader>ts', '<cmd>ToggleSpell<cr>', { desc = 'Toggle Spell' })
map('n', '<leader>td', '<cmd>ToggleDiagnostics<cr>', { desc = 'Toggle Diagtostics' })

-- tmux open under cursor in new tmux pane
map(
	'n',
	'<leader>gf',
	'<cmd>GoToFileWithTumux<cr>',
	{ noremap = true, silent = true, desc = 'Open file under cursor in new tmux pane' }
)

-- lazy
map('n', '<leader>L', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })

-- functions can be found in my usercmd.lua file
map('n', '<leader>xl', '<Cmd>LuafileExecute<CR>', { desc = 'Execute lua file' })
map('n', '<leader>bo', '<cmd>DeleteOtherBuffers<cr>', { desc = 'Delete all buffers except current', silent = true })
