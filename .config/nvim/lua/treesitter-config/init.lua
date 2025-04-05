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
	textobjects = {
		-- Selection of text objects
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj if cursor isn't on it
			keymaps = {
				-- -- Inner/outer function
				-- ["af"] = "@function.outer",
				-- ["if"] = "@function.inner",
				-- -- Inner/outer class
				-- ["ac"] = "@class.outer",
				-- ["ic"] = "@class.inner",
				-- -- Inner/outer block (e.g., if statements, loops)
				-- ["ab"] = "@block.outer",
				-- ["ib"] = "@block.inner",
				-- -- Inner/outer parameter
				-- ["aa"] = "@parameter.outer",
				-- ["ia"] = "@parameter.inner",
				-- -- Inner/outer call (function calls)
				-- ["aF"] = "@call.outer",
				-- ["iF"] = "@call.inner",
				-- Strings ("", '')
				["as"] = { query = "@string.outer", desc = "Around string" },
				["is"] = { query = "@string.inner", desc = "Inside string" },
				-- Parentheses ()
				["ap"] = { query = "@parameter.outer", desc = "Around parameter" },
				["ip"] = { query = "@parameter.inner", desc = "Inside parameter" },
				-- Braces/Blocks {}
				["ab"] = { query = "@block.outer", desc = "Around block" },
				["ib"] = { query = "@block.inner", desc = "Inside block" },
				-- Functions
				["af"] = { query = "@function.outer", desc = "Around function" },
				["if"] = { query = "@function.inner", desc = "Inside function" },
				-- Loops
				["al"] = { query = "@loop.outer", desc = "Around loop" },
				["il"] = { query = "@loop.inner", desc = "Inside loop" },
				-- Arrays []
				["aa"] = { query = "@array.outer", desc = "Around array" },
				["ia"] = { query = "@array.inner", desc = "Inside array" },
			},
			selection_modes = {
				["@string.outer"] = "v",
				["@string.inner"] = "v", -- Charwise for strings
				["@parameter.outer"] = "v",
				["@parameter.inner"] = "v", -- Charwise for params
				["@block.outer"] = "V",
				["@block.inner"] = "V", -- Linewise for blocks
				["@function.outer"] = "V",
				["@function.inner"] = "V", -- Linewise for functions
				["@loop.outer"] = "V",
				["@loop.inner"] = "V",
				["@array.outer"] = "v",
				["@array.inner"] = "v",
			},
		},
		-- Move between text objects
		move = {
			enable = true,
			set_jumps = true, -- Add to jumplist
			goto_next_start = {
				["]s"] = { query = "@string.outer", desc = "Next string start" },
				["]p"] = { query = "@parameter.outer", desc = "Next parameter start" },
				["]b"] = { query = "@block.outer", desc = "Next block start" },
				["]f"] = { query = "@function.outer", desc = "Next function start" },
				["]l"] = { query = "@loop.outer", desc = "Next loop start" },
				["]a"] = { query = "@array.outer", desc = "Next array start" },
			},
			goto_previous_start = {
				["[s"] = { query = "@string.outer", desc = "Previous string start" },
				["[p"] = { query = "@parameter.outer", desc = "Previous parameter start" },
				["[b"] = { query = "@block.outer", desc = "Previous block start" },
				["[f"] = { query = "@function.outer", desc = "Previous function start" },
				["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
				["[a"] = { query = "@array.outer", desc = "Previous array start" },
			},
			goto_next_end = {
				["]S"] = { query = "@string.outer", desc = "Next string end" },
				["]P"] = { query = "@parameter.outer", desc = "Next parameter end" },
				["]B"] = { query = "@block.outer", desc = "Next block end" },
				["]F"] = { query = "@function.outer", desc = "Next function end" },
				["]L"] = { query = "@loop.outer", desc = "Next loop end" },
				["]A"] = { query = "@array.outer", desc = "Next array end" },
			},
			goto_previous_end = {
				["[S"] = { query = "@string.outer", desc = "Previous string end" },
				["[P"] = { query = "@parameter.outer", desc = "Previous parameter end" },
				["[B"] = { query = "@block.outer", desc = "Previous block end" },
				["[F"] = { query = "@function.outer", desc = "Previous function end" },
				["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
				["[A"] = { query = "@array.outer", desc = "Previous array end" },
			},
		},
		-- Swap text objects (e.g., swap parameters)
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.outer",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.outer",
			},
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
