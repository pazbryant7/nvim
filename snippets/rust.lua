---@diagnostic disable: undefined-global

return {
	s('forr', {
		t('for '),
		i(1, 'i'),
		t(' in '),
		i(2, '0..10'),
		t(' {'),
		t({ '', '\t' }),
		i(3),
		t({ '', '}' }),
	}),

	s('forin', {
		t('for '),
		i(1, 'item'),
		t(' in '),
		i(2, 'iterable'),
		t(' {'),
		t({ '', '\t' }),
		i(3),
		t({ '', '}' }),
	}),

	s('wh', {
		t('while '),
		i(1, 'condition'),
		t(' {'),
		t({ '', '\t' }),
		i(2),
		t({ '', '}' }),
	}),

	s('if', {
		t('if '),
		i(1, 'condition'),
		t(' {'),
		t({ '', '\t' }),
		i(2),
		t({ '', '}' }),
	}),

	s('ife', {
		t('if '),
		i(1, 'condition'),
		t(' {'),
		t({ '', '\t' }),
		i(2),
		t({ '', '} else {' }),
		t({ '', '\t' }),
		i(3),
		t({ '', '}' }),
	}),

	s('ifei', {
		t('if '),
		i(1, 'condition1'),
		t(' {'),
		t({ '', '\t' }),
		i(2),
		t({ '', '} else if ' }),
		i(3, 'condition2'),
		t(' {'),
		t({ '', '\t' }),
		i(4),
		t({ '', '} else {' }),
		t({ '', '\t' }),
		i(5),
		t({ '', '}' }),
	}),

	s('match', {
		t('match '),
		i(1, 'variable'),
		t(' {'),
		t({ '', '\t' }),
		i(2, 'pattern'),
		t(' => {'),
		t({ '', '\t\t' }),
		i(3),
		t({ '', '\t},' }),
		t({ '', '\t_ => {' }),
		t({ '', '\t\t' }),
		i(4),
		t({ '', '\t},' }),
		t({ '', '}' }),
	}),

	s('st', {
		t('struct '),
		i(1, 'MyStruct'),
		t(' {'),
		t({ '', '\t' }),
		i(2),
		t({ '', '}' }),
	}),

	s('impl', {
		t('impl '),
		i(1, 'MyStruct'),
		t(' {'),
		t({ '', '\t' }),
		i(2),
		t({ '', '}' }),
	}),

	s('fn', {
		t('fn '),
		i(1, 'my_function'),
		t('('),
		i(2, 'args'),
		t(') -> '),
		i(3, 'ReturnType'),
		t(' {'),
		t({ '', '\t' }),
		i(4),
		t({ '', '}' }),
	}),

	s('main', {
		t('fn main() {'),
		t({ '', '\t' }),
		i(1),
		t({ '', '}' }),
	}),

	s('iflet', {
		t('if let '),
		i(1, 'Some(val)'),
		t(' = '),
		i(2, 'option'),
		t(' {'),
		t({ '', '\t' }),
		i(3),
		t({ '', '}' }),
	}),

	s('loop', {
		t('loop {'),
		t({ '', '\t' }),
		i(1),
		t({ '', '}' }),
	}),

	s('pr', {
		t('println!("'),
		i(1, '{:?}'),
		t('", '),
		i(2, 'value'),
		t(');'),
	}),
}
