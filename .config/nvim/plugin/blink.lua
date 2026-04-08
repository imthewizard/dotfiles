vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
})

require("blink.cmp").setup({
	keymap = {preset = "default"},
	snippets = {preset = "luasnip"},

	signature = {
		enabled = true,
		window = {border = "rounded"},
	},

	appearance = {
		-- use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	sources = {
		-- default = { 'lsp', 'path', 'snippets', 'buffer' },
		providers = {
			snippets = {
				min_keyword_length = 1,
				score_offset = 4,
			},
			lsp = {
				min_keyword_length = 2,
				score_offset = 3,
			},
			path = {
				min_keyword_length = 3,
				score_offset = 2,
			},
			buffer = {
				min_keyword_length = 3,
				score_offset = 1,
			},
		}
	},
})
