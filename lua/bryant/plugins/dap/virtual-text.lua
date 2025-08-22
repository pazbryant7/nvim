-- lua/plugins/dap/virtual_text.lua

local M = {}

function M.setup()
	require('nvim-dap-virtual-text').setup({
		enabled = true,
		-- You can add other virtual-text configurations here
	})
end

return M
