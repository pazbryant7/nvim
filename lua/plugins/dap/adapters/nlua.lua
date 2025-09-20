return {
	nlua = function(callback, config)
		local host = config.host or '127.0.0.1'
		local port = config.port or 8086

		if type(port) ~= 'number' or port < 1024 or port > 65535 then
			vim.notify('Invalid port ' .. tostring(port) .. ', using default 8086', vim.log.levels.WARN)
			port = 8086
		end

		callback({
			type = 'server',
			host = host,
			port = port,
		})
	end,
}
