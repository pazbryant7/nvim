local v = vim

local map = v.keymap.set

-- Manage exit and saves
map('n', '<c-f>', '<cmd>update<CR>', { desc = 'Save current buffer' })
map('n', '<leader>s', '<cmd>wa<CR>', { desc = 'Save all buffers' })
map('n', '<leader>q', '<cmd>q!<CR>', { desc = 'Quit without save' })
map('n', '<leader>Q', '<cmd>qa!<CR>', { desc = 'Quit all without save' })

-- better change inner word
map('n', '<C-c>', 'ciw', { desc = 'Better Change Inner Word' })

-- In Visual mode, moves the selected lines down and up by one line, then re-indents.
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down', silent = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up', silent = true })

-- In Normal mode, joins the line below to the current line, but keeps the cursor in its original column.
map('n', 'J', 'mzJ`z', { desc = 'Join line below (preserve cursor position)' })

-- Better neovim defaults
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and re-center view' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and re-center view' })
map('n', 'n', 'nzzzv', { desc = 'Next search result and center' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result and center' })

--  No highlights
map('n', '<Escape>', '<cmd>noh<CR>', { desc = 'No search highlights' })

-- movement left and right
map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Go To The Start Of The Line' })
map({ 'n', 'v', 'o' }, 'L', 'g_', { desc = 'Go To The End Of The Line' })

-- paste without overwrite register
map('x', '<leader>p', [["_dP]], { desc = 'Paste Without Overwrite Register ' })

-- copy without overwrite register
map({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy Without Overwrite Register' })
map('n', '<leader>Y', [["+Y]], { desc = 'Copy Full Line Without Overwrite Register' })

-- delete without overwrite register
map({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete Without Overwrite Register' })
map('n', '<leader>D', '"_dd', { desc = 'Delete Full Line Without Overwrite Register' })

-- align manually
map('v', '<', '<gv', { desc = 'Align Items To The Left' })
map('v', '>', '>gv', { desc = 'Align Items To The Right' })

-- custom rename
map('n', '<leader>cr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Custom Rename' })

-- print current path
map('n', '<leader>cp', function()
	vim.notify(vim.fn.expand('%:p'), vim.log.levels.INFO, { title = 'Neovim Alert' })
end, { desc = 'Print Current Path' })

-- swap maps
map({ 'n', 'v' }, ';', ':', { desc = 'Enter Command Mode' })
map({ 'n', 'v' }, ':', ';', { desc = 'Repeat last f/t/F/T search' })

-- already existing binds
map('n', 'ZQ', ':q!<CR>', { desc = 'Quit without saving' })
map('n', 'ZZ', ':wq<CR>', { desc = 'Save and quit' })

-- Navigate quickfix list without "no more items" errors
map('n', '<m-k>', '<cmd>silent! cnext<CR>zz', { desc = 'Quickfix: Next item' })
map('n', '<m-j>', '<cmd>silent! cprevious<CR>zz', { desc = 'Quickfix: Previous item' })

-- disable suspend neovim
map('n', '<c-z>', '<Nop>', { desc = 'Disable suspend neovim' })

-- usercmd keybinds
map('n', '<leader>ts', '<cmd>ToggleSpell<cr>', { desc = 'Toggle Spell}' })
map('n', '<leader>td', '<cmd>ToggleDiagnostics<cr>', { desc = 'Toggle Diagtostics}' })
map('n', '<leader>tc', '<cmd>ToggleAutoCompletion<cr>', { desc = 'Toggle BlinkCompletion}' })
