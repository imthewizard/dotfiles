local module = {}

---@alias Terminal
---| "'wezterm'" # Currently using wezterm
---| "'tmux'"    # Currently using tmux

---@class Direction
---@field left boolean|nil
---@field down boolean|nil
---@field up boolean|nil
---@field right boolean|nil

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
local function wezterm_split(direction)
	local arg

	if direction.left then
		arg = "--left"
	elseif direction.down then
		arg = "--bottom"
	elseif direction.up then
		arg = "--top"
	elseif direction.right then
		arg = "--right"
	end

	vim.system({"wezterm", "cli", "split-pane", arg})
end

---@param direction Direction
local function wezterm_activate_pane(direction)
	local arg

	if direction.left then
		arg = "--left"
	elseif direction.down then
		arg = "--down"
	elseif direction.up then
		arg = "--up"
	elseif direction.right then
		arg = "--right"
	end

	vim.system({"wezterm", "cli", "activate-pane-direction", arg})
end

---@param direction Direction
local function wezterm_has_pane_direction(direction)
	local arg
	if direction.left then
		arg = "--left"
	elseif direction.down then
		arg = "--bottom"
	elseif direction.up then
		arg = "--top"
	elseif direction.right then
		arg = "--right"
	end

	local obj = vim.system({"wezterm", "cli", "get-pane-direction", arg}, {text = true}):wait()

	-- Didn't return an id, no pane in that direction
	if obj.stdout == "" then
		return false
	else
		return true
	end
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

function module.setup()
	if process_running("wezterm") then
		module.terminal = "wezterm"
	end
end

function module.move_or_split_left()
	local direction = {left = true}

	if has_window_direction(direction) then
		-- Switch to the window in that direction
		vim.api.nvim_set_current_win(vim.fn.win_getid(vim.fn.winnr('h')))
	else
		-- No other window to move to (inside neovim), let's try the terminal
		if module.terminal == "wezterm" then
			if wezterm_has_pane_direction(direction) == false then
				-- No pane in that direction, create one first
				wezterm_split(direction)
			end
			-- Switch to the pane in that direction
			wezterm_activate_pane(direction)
		end
	end
end

function module.move_or_split_down()
	local direction = {down = true}

	if has_window_direction(direction) then
		-- Switch to the window in that direction
		vim.api.nvim_set_current_win(vim.fn.win_getid(vim.fn.winnr('j')))
	else
		-- No other window to move to (inside neovim), let's try the terminal
		if module.terminal == "wezterm" then
			if wezterm_has_pane_direction(direction) == false then
				-- No pane in that direction, create one first
				wezterm_split(direction)
			end
			-- Switch to the pane in that direction
			wezterm_activate_pane(direction)
		end
	end
end

function module.move_or_split_up()
	local direction = {up = true}

	if has_window_direction(direction) then
		-- Switch to the window in that direction
		vim.api.nvim_set_current_win(vim.fn.win_getid(vim.fn.winnr('k')))
	else
		-- No other window to move to (inside neovim), let's try the terminal
		if module.terminal == "wezterm" then
			if wezterm_has_pane_direction(direction) == false then
				-- No pane in that direction, create one first
				wezterm_split(direction)
			end
			-- Switch to the pane in that direction
			wezterm_activate_pane(direction)
		end
	end
end

function module.move_or_split_right()
	local direction = {right = true}

	if has_window_direction(direction) then
		-- Switch to the window in that direction
		vim.api.nvim_set_current_win(vim.fn.win_getid(vim.fn.winnr('l')))
	else
		-- No other window to move to (inside neovim), let's try the terminal
		if module.terminal == "wezterm" then
			if wezterm_has_pane_direction(direction) == false then
				-- No pane in that direction, create one first
				wezterm_split(direction)
			end
			-- Switch to the pane in that direction
			wezterm_activate_pane(direction)
		end
	end
end
return module
