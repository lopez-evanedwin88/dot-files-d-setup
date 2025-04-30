require("render-markdown").setup({
	code = {
		width = "block",
	},
	anti_conceal = {
		-- This enables hiding any added text on the line the cursor is on.
		enabled = false,
	},
})
