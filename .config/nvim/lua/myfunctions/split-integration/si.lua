local module = {}

local wezterm = require("myfunctions/split-integration/wezterm")

---@type Terminal | nil
module.terminal = nil

---@param process string # Name of the process
---@return boolean # If process is running
local function process_running(process)
	if vim.fn.executable("pgrep") then
		local obj = vim.system({"pgrep", process}):wait()
		local code = obj.code

		if code == 0 then
			-- success
			return true
		end
	end

	return false
end

---@param direction Direction
---@return boolean # If there is a window to the specified direction
local function has_window_direction(direction)
	local current_window = vim.fn.winnr()

	local other_window
	if direction.left then
		other_window = vim.fn.winnr('h')
	elseif direction.right then
		other_window = vim.fn.winnr('l')
	elseif direction.down then
		other_window = vim.fn.winnr('j')
	elseif direction.up then
		other_window = vim.fn.winnr('k')
	end
	if current_window ~= other_window then return true end

	return false
end

---@param direction Direction
---@return string # Ex: direction.left returns 'h'
local function direction_to_vim_key(direction)
	if direction.left then
		return 'h'
	elseif direction.right then
		return 'l'
	elseif direction.up then
		return 'k'
	else -- direction.down
		return 'j'
	end
end

local function move(direction)
	local window_number = vim.fn.winnr(direction_to_vim_key(direction))

	if has_window_direction(direction) then
		-- Switch to the window in that direction
		vim.api.nvim_set_current_win(vim.fn.win_getid(window_number))
	else
		-- No other window to move to (inside neovim), let's try the terminal
		if module.terminal == "wezterm" then
			if wezterm.has_pane_direction(direction) == false then
				-- No pane in that direction, create one first
				wezterm.split(direction)
			end
			-- Switch to the pane in that direction
			wezterm.activate_pane(direction)
		end
	end
end

function module.setup()
	if process_running("wezterm") then
		module.terminal = "wezterm"
	end
end

function module.move_left()  move({left  = true}) end
function module.move_right() move({right = true}) end
function module.move_up()    move({up    = true}) end
function module.move_down()  move({down  = true}) end

return module
