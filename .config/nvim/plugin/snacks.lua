vim.pack.add({"https://github.com/folke/snacks.nvim"})

local snacks = require("snacks")

snacks.setup({
	bigfile      = {enabled = true},
	indent       = {enabled = true},
	picker       = {enabled = true},
	quickfile    = {enabled = true},
	image = {
		enabled = true,
		doc = {
			enabled = false,
		},
	},
})

vim.keymap.set("n", "<leader>pf", function() snacks.picker.smart({filter={cwd = true}}) end, {desc = "Smart Find Files"})
vim.keymap.set("n", "<leader>pb", function() snacks.picker.buffers({filter={cwd = true}}) end, {desc = "Buffers"})
vim.keymap.set("n", "<leader>pg", function() snacks.picker.grep({filter={cwd = true}}) end, {desc = "Grep"})
vim.keymap.set("n", "<leader>sh", function() snacks.image.hover({filter={cwd = true}}) end, {desc = "Snacks Image Hover"})
