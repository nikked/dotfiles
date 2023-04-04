require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"tsserver",
		"pyright",
		"bashls",
		"terraformls",
		"dockerls",
		"jsonls",
		"yamlls",
		"vimls",
	},
})
