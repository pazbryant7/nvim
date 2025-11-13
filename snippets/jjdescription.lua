---@diagnostic disable: undefined-global
local currDate = os.date('%Y-%m-%d %H:%M:%S')

return {
	-- feat: A new feature
	-- Conventional Commit Snippets
	-- Feature
	s('jj:feat', {
		t('feat('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Fix
	s('jj:fix', {
		t('fix('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Chore
	s('jj:chore', {
		t('chore('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Documentation
	s('jj:docs', {
		t('docs('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Style
	s('jj:style', {
		t('style('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Refactor
	s('jj:refactor', {
		t('refactor('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Test
	s('jj:test', {
		t('test('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Performance
	s('jj:perf', {
		t('perf('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Continuous Integration
	s('jj:ci', {
		t('ci('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	s('jj:breaking', {
		-- Add line breaks before the BREAKING CHANGE tag
		t({ '', '', 'BREAKING CHANGE: ' }),
		-- Placeholder for the breaking change description
		i(1, 'description of the breaking change'),
	}),

	s('backup', {
		t('vault backup: ' .. currDate),
	}),

	s('spell', {
		t('chore(spell): update spell dictionary: ' .. currDate),
	}),

	s('snippets', {
		t('chore(snippets): update snippets collection: ' .. currDate),
	}),

	s('apps', {
		t('chore(apps): update default package list: ' .. currDate),
	}),

	s('nvim', {
		t('chore(nvim): update neovim sub module: ' .. currDate),
	}),

	s('plugins', {
		t('chore(plugins): update plugins package list: ' .. currDate),
	}),
}
