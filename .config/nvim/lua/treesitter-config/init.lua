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

-- Define go_to_context function
local function go_to_context(count)
	count = count or 1
	local bufnr = vim.api.nvim_get_current_buf()
	local parser = vim.treesitter.get_parser(bufnr)
	if not parser then
		vim.notify("No Treesitter parser for this buffer", vim.log.levels.WARN)
		return
	end
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	row = row - 1
	local tree = parser:parse()[1]
	local node = tree:root():descendant_for_range(row, col, row, col)
	if not node then
		vim.notify("No node found at cursor", vim.log.levels.WARN)
		return
	end
	local context_types = {
		"function_declaration",
		"function_definition",
		"method_declaration",
		"class_declaration",
		"struct_declaration",
		"block",
		"if_statement",
		"for_statement",
		"while_statement",
	}
	local current = node
	for _ = 1, count do
		while current and not vim.tbl_contains(context_types, current:type()) do
			current = current:parent()
		end
		if not current then
			vim.notify("No context found", vim.log.levels.WARN)
			return
		end
		current = current:parent() or current
	end
	local start_row, start_col = current:start()
	vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
end

-- Set keymap
vim.keymap.set("n", "[c", function()
	go_to_context(vim.v.count1)
end, { desc = "Jump to Treesitter Context" })

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
-- vim.keymap.set("n", "<leader>[", function()
-- 	require("treesitter-context").go_to_context(vim.v.count1)
-- end, { desc = "Jump to Context" })

vim.keymap.set("n", "<leader>[", function()
	go_to_context(vim.v.count1)
end, { desc = "Jump to Treesitter Context" })

vim.keymap.set("n", "<leader>tc", function()
	require("treesitter-context").toggle()
end, { desc = "Toggle Treesitter Context" })
