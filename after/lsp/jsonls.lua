return {
	settings = {
		json = {
			schemas = require('schemastore').json.schemas({
				ignore = {
					-- '.eslintrc',
					-- 'package.json',
				},
			}),
			validate = { enable = true },
		},
	},
}
