vim.pack.add({"https://github.com/folke/flash.nvim"})

local flash = require("flash")

flash.setup({
	modes = {
		char = {
			enabled = false,
		},
	},
})

vim.keymap.set({"n", "x", "o"}, "s", function() flash.jump() end, {desc = "Flash"})
vim.keymap.set({"n", "x", "o"}, "S", function() flash.treesitter() end, {desc = "Flash Treesitter"})
