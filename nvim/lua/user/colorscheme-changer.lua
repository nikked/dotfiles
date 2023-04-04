local colorschemes = { "catppuccin", "terafox", "moonfly" }

function NextColor(direction)
	-- Get the current colorscheme
	local current_scheme = vim.g.colors_name

	-- Get the index of the current colorscheme in the list
	local current_index = indexOf(colorschemes, current_scheme)

	-- Calculate the index of the next colorscheme in the list
	local next_index
	if direction == 1 then
		next_index = (current_index % #colorschemes) + 1
	else
		next_index = (current_index - 2) % #colorschemes + 1
	end

	-- Set the next colorscheme
	vim.api.nvim_command("colorscheme " .. colorschemes[next_index])
end

function indexOf(array, value)
	for i, v in ipairs(array) do
		if v == value then
			return i
		end
	end
	return 1
end
