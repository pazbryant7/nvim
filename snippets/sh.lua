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

	-- if statement
	s('if', {
		t('if [ '),
		i(1, 'condition'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands'),
		t({ '', 'fi' }),
	}),

	-- "if-else" statement
	s('ifelse', {
		t('if [ '),
		i(1, 'condition'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_true'),
		t({ '', 'else', '\t' }),
		i(3, 'commands_if_false'),
		t({ '', 'fi' }),
	}),

	-- "for" loop
	s('for', {
		t('for '),
		i(1, 'var'),
		t(' in '),
		i(2, 'values'),
		t({ '; do', '\t' }),
		i(3, 'commands'),
		t({ '', 'done' }),
	}),

	-- "while" loop
	s('while', {
		t('while [ '),
		i(1, 'condition'),
		t(' ]; do'),
		t({ '', '\t' }),
		i(2, 'commands'),
		t({ '', 'done' }),
	}),

	-- "case" statement
	s('case', {
		t('case '),
		i(1, 'variable'),
		t(' in'),
		t({ '', '\t' }),
		i(2, 'pattern1'),
		t({ ')', '\t\t' }),
		i(3, 'commands'),
		t({ '', '\t;;', '\t' }),
		i(4, 'pattern2'),
		t({ ')', '\t\t' }),
		i(5, 'commands'),
		t({ '', '\t;;', 'esac' }),
	}),

	-- "function" definition
	s('func', {
		i(1, 'function_name'),
		t('() {'),
		t({ '', '\t' }),
		i(2, 'commands'),
		t({ '', '}' }),
	}),

	-- "test" command (alternative to [ ])
	s('test', {
		t('test '),
		i(1, 'condition'),
		t({ '', 'if [ $? -eq 0 ]; then', '\t' }),
		i(2, 'commands_if_true'),
		t({ '', 'else', '\t' }),
		i(3, 'commands_if_false'),
		t({ '', 'fi' }),
	}),

	-- "until" loop
	s('until', {
		t('until [ '),
		i(1, 'condition'),
		t(' ]; do'),
		t({ '', '\t' }),
		i(2, 'commands'),
		t({ '', 'done' }),
	}),

	-- Check if a variable is null
	s('ifnull', {
		t('if [ -z "$'),
		i(1, 'variable'),
		t('" ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_null'),
		t({ '', 'fi' }),
	}),

	-- Check if a variable is not null
	s('ifnotnull', {
		t('if [ -n "$'),
		i(1, 'variable'),
		t('" ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_not_null'),
		t({ '', 'fi' }),
	}),

	-- Check if a file exists
	s('iffileexist', {
		t('if [ -f '),
		i(1, '"file_path"'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_file_exists'),
		t({ '', 'fi' }),
	}),

	-- Check if a directory exists
	s('ifdirexist', {
		t('if [ -d '),
		i(1, '"directory_path"'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_directory_exists'),
		t({ '', 'fi' }),
	}),

	-- Check if a file is readable
	s('ifreadable', {
		t('if [ -r '),
		i(1, '"file_path"'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_file_readable'),
		t({ '', 'fi' }),
	}),

	-- Check if a file is writable
	s('ifwritable', {
		t('if [ -w '),
		i(1, '"file_path"'),
		t(' ]; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_file_writable'),
		t({ '', 'fi' }),
	}),

	-- Check if two strings are equal
	s('ifequal', {
		t('if [ "$'),
		i(1, 'string1'),
		t('" = "$'),
		i(2, 'string2'),
		t('" ]; then'),
		t({ '', '\t' }),
		i(3, 'commands_if_equal'),
		t({ '', 'fi' }),
	}),

	-- Check if two strings are not equal
	s('ifnotequal', {
		t('if [ "$'),
		i(1, 'string1'),
		t('" != "$'),
		i(2, 'string2'),
		t('" ]; then'),
		t({ '', '\t' }),
		i(3, 'commands_if_not_equal'),
		t({ '', 'fi' }),
	}),

	-- Check if a variable is a number
	s('ifnumber', {
		t('if [ "$'),
		i(1, 'variable'),
		t('" -eq "$'),
		i(2, 'variable'),
		t('" ] 2>/dev/null; then'),
		t({ '', '\t' }),
		i(3, 'commands_if_number'),
		t({ '', 'else', '\t' }),
		i(4, 'commands_if_not_number'),
		t({ '', 'fi' }),
	}),

	-- Print a debug message
	s('debug', {
		t('echo "DEBUG: '),
		i(1, 'message'),
		t('"'),
	}),

	-- Check if a command exists
	s('ifcommandexists', {
		t('if command -v '),
		i(1, 'command'),
		t(' > /dev/null 2>&1; then'),
		t({ '', '\t' }),
		i(2, 'commands_if_command_exists'),
		t({ '', 'else', '\t' }),
		i(3, 'commands_if_command_not_exists'),
		t({ '', 'fi' }),
	}),

	s('eq', {
		i(1, 'variable'),
		t('="$('),
		i(2),
		t(')"'),
		i(3),
	}),
}
