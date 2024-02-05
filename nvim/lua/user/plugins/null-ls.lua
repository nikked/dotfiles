local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- null_ls.builtins.completion.spell,
		-- null_ls.builtins.code_actions.ltrs,
		null_ls.builtins.code_actions.gitsigns,
		-- null_ls.builtins.code_actions.proselint,
		null_ls.builtins.formatting.prettier,
		-- null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.stylish_haskell,
		-- null_ls.builtins.diagnostics.proselint,
		null_ls.builtins.diagnostics.gitlint,
		null_ls.builtins.diagnostics.markdownlint,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.ruff,
		-- null_ls.builtins.diagnostics.ltrs,
		null_ls.builtins.diagnostics.jsonlint,
		null_ls.builtins.diagnostics.commitlint,
	},
})
