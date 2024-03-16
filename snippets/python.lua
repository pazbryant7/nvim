---@diagnostic disable: undefined-global

return {
	s('fori', {
		t('for '),
		i(1, 'i'),
		t(' in range(len('),
		i(2, 'iterable'),
		t(')):'),
		t({ '', '\t' }),
		i(3, 'pass'),
	}),

	s('forv', {
		t('for '),
		i(1, 'item'),
		t(' in '),
		i(2, 'iterable'),
		t(':'),
		t({ '', '\t' }),
		i(3, 'pass'),
	}),

	s('forkv', {
		t('for '),
		i(1, 'key'),
		t(', '),
		i(2, 'value'),
		t(' in '),
		i(3, 'dictionary'),
		t('.items():'),
		t({ '', '\t' }),
		i(4, 'pass'),
	}),

	s('wh', {
		t('while '),
		i(1, 'condition'),
		t(':'),
		t({ '', '\t' }),
		i(2, 'pass'),
	}),

	s('if', {
		t('if '),
		i(1, 'condition'),
		t(':'),
		t({ '', '\t' }),
		i(2, 'pass'),
	}),

	s('ife', {
		t('if '),
		i(1, 'condition'),
		t(':'),
		t({ '', '\t' }),
		i(2, 'pass'),
		t({ '', 'else:' }),
		t({ '', '\t' }),
		i(3, 'pass'),
	}),

	s('ifei', {
		t('if '),
		i(1, 'condition1'),
		t(':'),
		t({ '', '\t' }),
		i(2, 'pass'),
		t({ '', 'elif ' }),
		i(3, 'condition2'),
		t(':'),
		t({ '', '\t' }),
		i(4, 'pass'),
		t({ '', 'else:' }),
		t({ '', '\t' }),
		i(5, 'pass'),
	}),

	s('match', {
		t('match '),
		i(1, 'subject'),
		t(':'),
		t({ '', '\tcase ' }),
		i(2, 'pattern'),
		t(':'),
		t({ '', '\t\t' }),
		i(3, 'pass'),
		t({ '', '\tcase _:' }),
		t({ '', '\t\t' }),
		i(4, 'pass'),
	}),

	s('cls', {
		t('class '),
		i(1, 'MyClass'),
		t(':'),
		t({ '', '\t' }),
		t('def __init__(self, '),
		i(2, 'args'),
		t('):'),
		t({ '', '\t\t' }),
		i(3, 'pass'),
	}),

	s('clse', {
		t('class '),
		i(1, 'ChildClass'),
		t('('),
		i(2, 'ParentClass'),
		t('):'),
		t({ '', '\t' }),
		t('def __init__(self, '),
		i(3, 'args'),
		t('):'),
		t({ '', '\t\t' }),
		t('super().__init__('),
		rep(3),
		t(')'),
		t({ '', '\t\t' }),
		i(4, 'pass'),
	}),

	s('def', {
		t('def '),
		i(1, 'my_function'),
		t('('),
		i(2, 'params'),
		t('):'),
		t({ '', '\t' }),
		i(3, 'pass'),
	}),

	s('lam', {
		t('lambda '),
		i(1, 'args'),
		t(': '),
		i(2, 'expression'),
	}),

	s('try', {
		t('try:'),
		t({ '', '\t' }),
		i(1, 'pass'),
		t({ '', 'except ' }),
		i(2, 'Exception'),
		t(' as e:'),
		t({ '', '\t' }),
		i(3, 'pass'),
	}),

	s('lc', {
		t({ '[' }),
		i(1, 'expression'),
		t(' for '),
		i(2, 'item'),
		t(' in '),
		i(3, 'iterable'),
		t({ ']' }),
	}),

	s('pr', {
		t('print('),
		i(1),
		t(')'),
	}),
}
