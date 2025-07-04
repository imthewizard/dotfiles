local tmux = {}

local function direction_to_activate_term(direction)
	if direction.left then
		return 'L'
	elseif direction.down then
		return 'D'
	elseif direction.up then
		return 'U'
	else -- direction.right
		return 'R'
	end
end

local function direction_to_exists_term(direction)
	if direction.left then
		return "left"
	elseif direction.down then
		return "bottom"
	elseif direction.up then
		return "top"
	else -- direction.right
		return "right"
	end
end

function tmux.split(direction)
	if direction.right then
		vim.system({"tmux", "split-window", '-h'}):wait()
	elseif direction.down then
		vim.system({"tmux", "split-window", '-v'}):wait()
	end
end

function tmux.activate_pane(direction)
	local dir = direction_to_activate_term(direction)
	vim.system({"tmux", "select-pane", '-'..dir}):wait()
end

function tmux.has_pane_direction(direction)
	local dir = direction_to_exists_term(direction)
	local ret = vim.system({"tmux", "display-message", "-p", "'#{pane_at_"..dir.."}'"}, {text = true}):wait().stdout

	if ret ~= nil then
		if string.find(ret, "0") == nil then
			return false
		else
			return true
		end
	end
end


return tmux
