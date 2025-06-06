-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ts_ls.lua
return {
	cmd = {"typescript-language-server", "--stdio"},
	filetypes = {
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
	},
}