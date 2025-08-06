---@diagnostic disable: undefined-global

return {
	-- TODO
	s('TODO', {
		i(1, 'FIX|HACK|WARN|PERF|NOTE|TEST'),
		t(':'),
		i(2, ' Description'),
	}),

	s('code', {
		t('`'),
		i(1),
		t('`'),
		i(2),
	}),
}
