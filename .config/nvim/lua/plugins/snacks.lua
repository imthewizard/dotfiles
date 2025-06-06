return { 
	"folke/snacks.nvim",
	--dependencies = { "folke/flash.nvim" },
	priority = 1000,
	lazy = false,
	opts = {
		bigfile      = {enabled = true},
		indent       = {enabled = true},
		picker       = {enabled = true},
		image        = {enabled = true},
		quickfile    = {enabled = true},
		scope        = {enabled = true},
		statuscolumn = {enabled = true},
		words        = {enabled = true},
	},
	
	keys = {
		{ "<leader>pf", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>pb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>pg", function() Snacks.picker.grep() end, desc = "Grep" },
	},
}