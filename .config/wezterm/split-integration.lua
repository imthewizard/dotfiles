local wezterm = require("wezterm")
local module = {}

local function MoveOrSplitWezterm(window, direction)
	local activeTab = window:active_tab()
	local activePane = window:active_pane()

	-- Checks if there exists a pane in a specified direction.
	-- If there isn't, create one. Otherwise, activate it.
	local chosenPane = activeTab:get_pane_direction(direction)
	if (chosenPane == nil) then
		if direction ==	"Up" then
			activePane:split({direction = "Top"}) -- Top instead of Up
		elseif direction == "Down" then
			activePane:split({direction = "Bottom"}) -- Bottom instead of Down
		else
			activePane:split({direction = direction})
		end
	else
		chosenPane:activate()
	end
end

function module.MoveOrSplit(window, pane, key)
	local wezDirection = {
		h = "Left",
		j = "Down",
		k = "Up",
		l = "Right",
	}

	if ((pane:get_foreground_process_name():sub(-4)) == "nvim") then
		window:perform_action({
			SendKey = {key = key, mods = 'CTRL'},
		}, pane)
	else
		MoveOrSplitWezterm(window, wezDirection[key])
	end
end

function module.Resize(window, pane, key)
	local wezDirection = {
		h = "Left",
		j = "Down",
		k = "Up",
		l = "Right",
	}

	if ((pane:get_foreground_process_name():sub(-4)) == "nvim") then
		window:perform_action({
			SendKey = {key = key, mods = 'CTRL|SHIFT'},
		}, pane)
	else
		wezterm.action.AdjustPaneSize({wezDirection[key], 5})
	end
end

return module
