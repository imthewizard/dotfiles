return {
	"L3MON4D3/LuaSnip",
	dependencies = {"rafamadriz/friendly-snippets"},
	version = "v2.*",

	opts = {
		history = true,
		region_check_events = "InsertEnter",
		delete_check_events = "TextChanged,InsertLeave",
	},

	config = function(_, opts)
		require("luasnip").setup(opts)
		require("luasnip.loaders.from_vscode").lazy_load()
	end
}
