---@diagnostic disable: undefined-global
local currDate = os.date('%Y-%m-%d %H:%M:%S')

return {
	-- feat: A new feature
	-- Conventional Commit Snippets
	-- Feature
	s('git:feat', {
		t('feat('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Fix
	s('git:fix', {
		t('fix('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Chore
	s('git:chore', {
		t('chore('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Documentation
	s('git:docs', {
		t('docs('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Style
	s('git:style', {
		t('style('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Refactor
	s('git:refactor', {
		t('refactor('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Test
	s('git:test', {
		t('test('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Performance
	s('git:perf', {
		t('perf('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	-- Continuous Integration
	s('git:ci', {
		t('ci('),
		i(1, 'scope'),
		t('): '),
		i(2, 'description'),
	}),

	s('git:breaking', {
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
}
