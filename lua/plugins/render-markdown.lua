return {
	'MeanderingProgrammer/render-markdown.nvim',
	ft = 'markdown',
	enabled = true,
	dependencies = {
		{
			'3rd/image.nvim',
			enabled = false,
			build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
			opts = {
				backend = 'ueberzug',
				processor = 'magick_cli',
				integrations = {
					markdown = {
						enabled = true,
						clear_in_insert_mode = true,
						download_remote_images = true,
						only_render_image_at_cursor = true,
						only_render_image_at_cursor_mode = 'popup', -- or "inline"
						floating_windows = false, -- if true, images will be rendered in floating markdown windows
						filetypes = { 'markdown', 'vimwiki' }, -- markdown extensions (ie. quarto) can go here
					},
				},
			},
			config = function(_, opts)
				require('image').setup(opts)
			end,
		},
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
	opts = {
		checkbox = {
			custom = {
				todo = { raw = '[~]', rendered = '󰅗 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
			},
		},
	},
}
