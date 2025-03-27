require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"dockerfile",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"bash",
		"lua",
		"vim",
		"vimdoc",
		"vue",
		"query",
		"python",
		"vim",
		"sql",
		"swift",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
})

require("treesitter-context").setup({
	enable = false, -- Enable by default
	max_lines = 3, -- No limit on context lines (0 = unlimited)
	min_window_height = 0, -- No minimum window height to show context
	line_numbers = true, -- Show line numbers in context
	multiline_threshold = 1, -- Max lines before collapsing multi-line contexts
	trim_scope = "outer", -- Trim to outer scope (vs "inner")
	mode = "topline", -- Stick to cursor position ("topline" alternative)
	separator = "-", -- Line separator style (can be nil or custom char)
	zindex = 20, -- Floating window z-index
	on_attach = nil,
})

-- Optional keymaps
vim.keymap.set("n", "<leader>[", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Jump to Context" })

vim.keymap.set("n", "<leader>tc", function()
	require("treesitter-context").toggle()
end, { desc = "Toggle Treesitter Context" })
