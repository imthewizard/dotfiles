local wezterm = {}

---@param direction Direction
---@see dir_to_string
---@return string # Same as dir_to_string, but dir.down becomes "bottom" and dir.up "top"
local function dir_to_string_split(direction)
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

---@param direction Direction
---@see dir_to_string_split
---@return string # The direction as a string. Ex: direction.left returns "left"
local function dir_to_string(direction)
	if direction.left then
		return "left"
	elseif direction.down then
		return "down"
	elseif direction.up then
		return "up"
	else -- direction.right
		return "right"
	end
end

---Uses wezterm cli to split in the desired direction
---@param direction Direction
function wezterm.split(direction)
	local dir = dir_to_string_split(direction)

	vim.system({"wezterm", "cli", "split-pane", "--"..dir})
end

---Uses wezterm cli to activate a pane in the desired direction
---@param direction Direction
function wezterm.activate_pane(direction)
	local dir = dir_to_string(direction)

	vim.system({"wezterm", "cli", "activate-pane-direction", dir})
end

---@param direction Direction
---@return boolean # If there exists a pane in the specified direction
function wezterm.has_pane_direction(direction)
	local dir = dir_to_string(direction)

	local obj = vim.system({"wezterm", "cli", "get-pane-direction", dir}, {text = true}):wait()

	-- Didn't return an id, no pane in that direction
	if obj.stdout == "" then
		return false
	else
		return true
	end
end

return wezterm
