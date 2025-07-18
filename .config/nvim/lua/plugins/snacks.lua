return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile      = {enabled = true},
		indent       = {enabled = true},
		picker       = {enabled = true},
		quickfile    = {enabled = true},
		image        = {enabled = true},
		statuscolumn = {enabled = true},
	},

	keys = {
		{ "<leader>pf", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>pb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>pg", function() Snacks.picker.grep() end, desc = "Grep" },
	},
}
