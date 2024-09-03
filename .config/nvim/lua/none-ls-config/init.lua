local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettierd,
		formatting.black,
		-- formatting.blackd,
		formatting.djlint,
		completion.spell,
		-- require("none-ls.diagnostics.eslint_d"),
		diagnostics.djlint,
		diagnostics.stylelint,
	},
})
