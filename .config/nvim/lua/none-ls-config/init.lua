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
		formatting.swiftlint,
		formatting.swiftformat,
		formatting.djlint,
		formatting.hclfmt,
		completion.spell,
		-- require("none-ls.diagnostics.eslint_d"),
		diagnostics.djlint,
		-- diagnostics.stylelint,
		-- Custom TFLint diagnostics source
		{
			method = null_ls.methods.DIAGNOSTICS,
			filetypes = { "terraform", "hcl" },
			generator = {
				fn = function(params)
					local current_diagnostics = {}
					local tflint_cmd = "tflint --format json " .. params.bufname -- TFLint command with JSON output

					-- Run the TFLint command and capture the output
					local output = vim.fn.system(tflint_cmd)
					local results = vim.fn.json_decode(output)

					-- Debug: Print the command to ensure it's correct
					-- print("Running command:", tflint_cmd)

					-- print("TFLint Output:", output) -- Debug: Print raw output

					-- Check if JSON decoding works
					if not results then
						print("Failed to decode JSON output")
						return current_diagnostics
					end

					-- Parse the JSON output and convert it into diagnostics
					if results and type(results) == "table" then
						for _, result in ipairs(results) do
							table.insert(current_diagnostics, {
								row = result.line,
								col = result.column,
								end_col = result.end_column or result.column + 1, -- Adjust column if necessary
								source = "TFLint",
								message = result.message,
								severity = vim.diagnostic.severity[result.level:upper()]
									or vim.diagnostic.severity.ERROR,
							})
						end
					end
					return current_diagnostics
				end,
			},
		},
	},
})
