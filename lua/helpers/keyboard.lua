map = vim.api.nvim_set_keymap

-- normal mode keybinding setter
function nm(key, command)
	map('n', key, command, {noremap = true})
end

-- input mode keybinding setter
function im(key, command)
	map('i', key, command, {noremap = true})
end

-- visual mode keybinding setter
function vm(key, command)
	map('v', key, command, {noremap = true})
end

-- terminal mode keybinding setter
function tm(key, command)
	map('t', key, command, {noremap = true})
end
