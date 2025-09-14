-- Fun fact: I don't remember why this was called grounds

local color = require("utils/color")
local hsl = color.hsl

local colors = {
	grey = hsl(40, 8, 10),
	grey2 = hsl(40, 8, 15),
	grey3 = hsl(40, 8, 20),

	fg = hsl(40, 8, 70),

	white = hsl(40, 8, 90),

	red = hsl(0, 80, 40),
	red2 = hsl(0, 80, 60),
	green = hsl(120, 80, 30),
	green2 = hsl(130, 80, 60),
	green3 = hsl(130, 80, 80),
	blue = hsl(220, 80, 60),
	blue2 = hsl(220, 80, 70),

	yellow = hsl(55, 90, 50),
	yellow2 = hsl(55, 90, 65),
	orange = hsl(30, 80, 60),
	cyan = hsl(180, 80, 50),
	cyan2 = hsl(180, 80, 70),
	purple = hsl(275, 80, 70),
	pink = hsl(300, 85, 70),
}

local highlights = {
	Normal = {bg = colors.grey, fg = colors.fg},
	LineNr = {bg = colors.grey2, fg = colors.fg},

	Constant = {fg = colors.fg, bold = true},
	PreProc = {fg = colors.fg},
	Comment = {bg = colors.grey3, fg = colors.fg},

	String = {fg = colors.green2},
	Character = {fg = colors.green},
	Number = {fg = colors.blue2},
	Float = {fg = colors.blue2},
	Boolean = {fg = colors.yellow},

	Operator = {fg = colors.green3},
	Special = {fg = colors.cyan},
	Identifier = {fg = colors.white},
	Type = {fg = colors.purple},

	Function = {fg = colors.yellow},
	Statement = {fg = colors.red2},

	Error = {fg = colors.red},

	-- Tree Sitter
	["@constant"] = {link = "Constant"},
	["@variable"] = {fg = colors.white},
	["@type.builtin"] = {fg = colors.purple},

	-- LSP
	DiagnosticError = {bg = colors.red2, fg = colors.grey},
	DiagnosticWarn= {bg = colors.orange, fg = colors.grey},

	-- Plugin-specific
	MiniHipatternsTodo = {bg = colors.green2, fg = colors.grey},
	MiniHipatternsHack = {bg = colors.orange, fg = colors.grey},
	MiniHipatternsFixme = {bg = colors.red2, fg = colors.grey},

	MiniTrailspace = {bg = colors.red2, fg = colors.grey},

	-- My config
	SelectedLineNr = {fg = colors.yellow2, bold = true, italic = true},
}

for group, opts in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, opts)
end
