default: format

format:
    sh -c 'stylua --config-path .stylua.toml .'
