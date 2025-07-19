local v = vim

local map = v.keymap.set

-- stylua: ignore start
-- custom keymaps

-- better change inner word
map('n', '<C-c>', 'ciw', { desc = 'Better Change Inner Word' })

--  No highlights
map('n', '<Escape>', '<cmd>noh<CR>', { desc = 'No search highlights' })

-- movement left and right
map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Go To The Start Of The Line' })
map({ 'n', 'v', 'o' }, 'L', 'g_', { desc = 'Go To The End Of The Line' })

-- paste without overwrite register
map("x", "<leader>p", [["_dP]], { desc = "Paste Without Overwrite Register " })

-- copy without overwrite register
map({"n", "v"}, "<leader>y", [["+y]],{ desc="Copy Without Overwrite Register" })
map("n", "<leader>Y", [["+Y]], { desc="Copy Full Line Without Overwrite Register"})

-- delete without overwrite register
map({"n", "v"}, "<leader>d", "\"_d", { desc="Delete Without Overwrite Register" })
map('n', "<leader>D", "\"_dd", { desc = "Delete Full Line Without Overwrite Register" })

-- align manually
map('v', '<', '<gv', { desc = 'Align Items To The Left' })
map('v', '>', '>gv', { desc = 'Align Items To The Right' })

-- custom rename
map('n', '<leader>cr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Custom Rename"})

-- print current path
map('n', '<leader>cp', function()
  vim.notify(vim.fn.expand('%:p'), vim.log.levels.INFO, { title = "Neovim Alert" })
end, { desc = "Print Current Path" })

-- swap maps
map({'n',"v"}, ';', ':', { desc = "Enter Command Mode" })
map({'n',"v"}, ':', ';', { desc = "Repeat last f/t/F/T search" })

-- already existing binds
map('n', 'ZQ', ':q!<CR>', { desc = 'Quit without saving' })
map('n', 'ZZ', ':wq<CR>', { desc = 'Save and quit' })

-- Navigate quickfix list without "no more items" errors
map('n', '<c-k>', '<cmd>silent! cnext<CR>', { desc = 'Quickfix: Next item', })
map('n', '<c-j>', '<cmd>silent! cprevious<CR>', { desc = 'Quickfix: Previous item', })
