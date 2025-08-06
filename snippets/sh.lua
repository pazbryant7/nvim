---@diagnostic disable: undefined-global

return {
	-- instert variable
	s('va', {
		t('"$'),
		i(1),
		t('"'),
		i(2),
	}),

	s('home', {
		t('$HOME/'),
		i(1),
	}),
}
