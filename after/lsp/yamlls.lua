return {
	settings = {
		yaml = {
			schemaStore = {
				url = '',
				enable = false,
			},
			schemas = require('schemastore').yaml.schemas({
				ignore = {},
			}),
		},
	},
}
