vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"<filetype>"},
	callback = function() vim.treesitter.start() end,
})
