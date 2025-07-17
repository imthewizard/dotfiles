-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/html.lua
return {
	cmd = {"vscode-html-language-server", "--stdio"},
	filetypes = {"html", "templ"},
	single_file_support = true,
	init_options = {
		provideFormatter = true,
		embeddedLanguages = {css = true, javascript = true},
		configurationSection = {"html", "css", "javascript"},
	},
}