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

	s('hdr', {
		t('#!/bin/sh'),
		t({ '', '' }),
		t('set -eu'),
		t({ '', '' }),
		i(1),
	}),

	s('forin', {
		t('for '),
		i(1, 'var'),
		t(' in '),
		i(2, 'item1 item2'),
		t('; do'),
		t({ '', '\t' }),
		i(3, '# code'),
		t({ '', 'done' }),
	}),

	s('wh', {
		t('while [ '),
		i(1, 'condition'),
		t(' ]; do'),
		t({ '', '\t' }),
		i(2, '# code'),
		t({ '', 'done' }),
	}),

	s('until', {
		t('until [ '),
		i(1, 'condition'),
		t(' ]; do'),
		t({ '', '\t' }),
		i(2, '# code'),
		t({ '', 'done' }),
	}),

	s('if', {
		t('if [ '),
		i(1, 'condition'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, '# code'),
		t({ '', 'fi' }),
	}),

	s('ife', {
		t('if [ '),
		i(1, 'condition'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, '# code'),
		t({ '', 'else' }),
		t({ '', '\t' }),
		i(3, '# code'),
		t({ '', 'fi' }),
	}),

	s('ifei', {
		t('if [ '),
		i(1, 'condition1'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, '# code'),
		t({ '', 'elif [ ' }),
		i(3, 'condition2'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(4, '# code'),
		t({ '', 'else' }),
		t({ '', '\t' }),
		i(5, '# code'),
		t({ '', 'fi' }),
	}),

	s('case', {
		t('case '),
		i(1, '$variable'),
		t(' in'),
		t({ '', '\t' }),
		i(2, 'pattern1'),
		t(')'),
		t({ '', '\t\t' }),
		i(3, '# code'),
		t({ '', '\t\t;;' }),
		t({ '', '\t*)' }),
		t({ '', '\t\t' }),
		i(4, '# default'),
		t({ '', '\t\t;;' }),
		t({ '', 'esac' }),
	}),

	s('fn', {
		i(1, 'my_function'),
		t('() {'),
		t({ '', '\t' }),
		i(2, '# code'),
		t({ '', '}' }),
	}),
}
