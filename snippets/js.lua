---@diagnostic disable: undefined-global

return {
	s('clg', {
		t('console.log('),
		i(1),
		t(')'),
		i(2),
	}),

	s('tl', {
		t('${'),
		i(1, 'variable'),
		t('}'),
		i(0),
	}),
}
