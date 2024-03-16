---@diagnostic disable: undefined-global

return {
	-- TODO
	s('todo', {
		t('TODO: '),
		i(1, 'describe what needs to be done'),
	}),

	--- FIX
	s('todo:fix', {
		t('FIX: '),
		i(1, 'describe what needs to be done'),
	}),

	-- HACK
	s('todo:hack', {
		t('HACK: '),
		i(1, 'explain the workaround or hack here'),
	}),

	-- WARN
	s('todo:warn', {
		t('WARN: '),
		i(1, 'explain the warning here'),
	}),

	-- PERF
	s('todo:perf', {
		t('PERF: '),
		i(1, 'describe the performance issue or suggestion'),
	}),

	-- NOTE
	s('todo:note', {
		t('NOTE: '),
		i(1, 'add a note or explanation here'),
	}),

	-- TEST
	s('todo:test', {
		t('TEST: '),
		i(1, 'describe the test case or issue here'),
	}),

	-- File type
	s('fyletype', {
		t('vim: ft='),
		i(1, 'type'),
	}),

	s('code', {
		t('`'),
		i(1),
		t('`'),
		i(2),
	}),

	s('code2', {
		t('``'),
		i(1),
		t('``'),
		i(2),
	}),
}
