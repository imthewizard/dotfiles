local g = vim.g
local opt = vim.opt

opt.termguicolors = true
g.mapleader = " "
g.maplocalleader = " "

----------------------------------------------------
--                      LSP                       --
----------------------------------------------------
-- The log file starts getting big quite fast, only turn it on when needed
vim.lsp.log.set_level("off")

-- Enable all lsps that have a configuration in .config/nvim/lsp
for name, _ in vim.fs.dir(vim.fn.stdpath("config") .. "/lsp") do
	local name_without_extension = vim.fn.fnamemodify(name, ":r")
	vim.lsp.enable(name_without_extension)
end
----------------------------------------------------
----------------------------------------------------


----------------------------------------------------
--                    Settings                    --
----------------------------------------------------
-- Status Column
vim.o.statuscolumn = "%!v:lua.require('status/statuscolumn').statuscolumn()"

-- Colorscheme
vim.cmd("colorscheme grounds")

-- Splitting
opt.splitbelow = true
opt.splitright = true

-- Searching/Line numbering
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true

-- Tab/Indentation related
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- My preferred assembler
vim.filetype.add({
	extension = {
		fasm = "fasm",
		asm = "fasm",
		inc = "fasm"
	}
})
----------------------------------------------------
----------------------------------------------------


----------------------------------------------------
--                    Keymaps                     --
----------------------------------------------------
local keymap = vim.keymap.set

local shh_nore = {noremap = true, silent = true}

-- Split integration with wezterm using the same key
local split_integration = require("utils/split-integration/si")
split_integration.setup()
keymap("n", "<c-h>", split_integration.move_left)
keymap("n", "<c-j>", split_integration.move_down)
keymap("n", "<c-k>", split_integration.move_up)
keymap("n", "<c-l>", split_integration.move_right)

keymap("n", "<c-w>j", ":split<CR>", shh_nore)
keymap("n", "<c-w>l", ":vsplit<CR>", shh_nore)

-- Remove search highlighting with esc
keymap("n", "<ESC>", ":noh<CR>", shh_nore)

-- LSP Pretty Hover
keymap("n", "K", ":lua require('pretty_hover').hover()<CR>", shh_nore)

-- Remap CTRL-c to Esc + JJ to escape insert mode
-- Might remove one of these in the future
keymap("i", "<c-c>", "<Esc>", shh_nore)
keymap("i", "jj", "<Esc>", shh_nore)
----------------------------------------------------
----------------------------------------------------
