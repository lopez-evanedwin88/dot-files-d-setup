local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
		require("none-ls.diagnostics.eslint_d"),
		completion.spell,
	},
})
