-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua
return {
	cmd = {"lua-language-server"},
	filetypes = {"lua"},
	root_markers = {
		'.luarc.json',
		'.luarc.jsonc',
		'.luacheckrc',
		'.stylua.toml',
		'stylua.toml',
		'selene.toml',
		'selene.yml',
		'.git',
	},

	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
				},
			},
		},
	},
}
