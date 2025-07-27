return {
	'Mofiqul/vscode.nvim',
	config = function()
		require('vscode').setup({
			transparent = false,
			italic_comments = false,
			underline_links = true,
			disable_nvimtree_bg = true,
			terminal_colors = true,
		})
		vim.cmd.colorscheme('vscode')
	end,
}
