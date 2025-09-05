---@diagnostic disable: undefined-global

return {

	s('link', {
		t('[['),
		i(1, 'title'),
		t(']]'),
	}),

	s('ilink', {
		t('['),
		i(1, 'text'),
		t(']('),
		i(2, 'url'),
		t(')'),
	}),

	s('bh', {
		t('# '),
		i(1, 'Bold Heading'),
		t(' '),
		t('**'),
		i(2, 'bold text'),
		t('**'),
	}),

	s('h1', {
		t('# '),
		i(1, 'Heading 1'),
	}),

	s('h2', {
		t('## '),
		i(1, 'Heading 2'),
	}),

	s('cb', {
		t('```'),
		i(1, 'language'),
		t('\n'),
		i(2, 'code'),
		t('\n'),
		t('```'),
	}),

	s('ul', {
		t('- '),
		i(1, 'list item'),
	}),

	s('ol', {
		t('1. '),
		i(1, 'list item'),
	}),

	s('task', {
		t('- [ ] '),
		i(1, 'task'),
	}),

	s('hr', {
		t('---'),
	}),

	s('b', {
		t('**'),
		i(1, 'bold text'),
		t('**'),
	}),

	s('i', {
		t('*'),
		i(1, 'italic text'),
		t('*'),
	}),

	s('callout', {
		t('> [!note] '),
		i(1, 'title'),
		t('\n> '),
		i(2, 'content'),
		t('\n'),
	}),

	s('calloutt', {
		t('> [!todo] '),
		i(1, 'title'),
		t('\n> '),
		i(2, 'content'),
		t('\n'),
	}),
}
