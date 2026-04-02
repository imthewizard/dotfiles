vim.api.nvim_create_autocmd("LspAttach", {
	once = true,
	callback = function()
		vim.pack.add({"https://github.com/Fildo7525/pretty_hover"})
		require("pretty_hover").setup()
	end,
})
