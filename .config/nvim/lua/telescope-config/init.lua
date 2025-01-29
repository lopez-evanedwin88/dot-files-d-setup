require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		mappings = {
			i = {
				["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
				["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
				["<C-l>"] = require("telescope.actions").select_default, -- open file
			},
		},
	},
	pickers = {
		find_files = {
			file_ignore_patterns = { "node_modules", ".git", ".venv" },
			hidden = true,
		},
	},
	live_grep = {
		file_ignore_patterns = { "node_modules", ".git", ".venv" },
		additional_args = function(_)
			return { "--hidden" }
		end,
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

require("telescope").load_extension("luasnip")
require("telescope").load_extension("noice")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("fzf")

-- local TelescopeColor = {
-- 	TelescopePromptBorder = { bg = "none", fg = "gray" },
-- 	TelescopeResultsBorder = { bg = "none", fg = "gray" },
-- 	TelescopePreviewBorder = { bg = "none", fg = "gray" },
-- }
--
-- for hl, col in pairs(TelescopeColor) do
-- 	vim.api.nvim_set_hl(0, hl, col)
-- end

-- function _GREP_STRING_INPUT()
-- 	-- Default values
-- 	local default_case_sensitive = false
-- 	local default_word_match = false
--
-- 	local case_sensitive_input =
-- 		vim.fn.input(string.format("Case Sensitive? (y/n, default: %s): ", default_case_sensitive and "y" or "n"))
-- 	local case_sensitive = case_sensitive_input == "y" or (case_sensitive_input == "" and default_case_sensitive)
--
-- 	local word_match_input =
-- 		vim.fn.input(string.format("Match whole word? (y/n, default: %s): ", default_word_match and "y" or "n"))
-- 	local word_match = word_match_input == "y" or (word_match_input == "" and default_word_match)
--
-- 	builtin.grep_string({
-- 		search = vim.fn.input("Grep > "),
-- 		case_sensitive = case_sensitive,
-- 		word_match = word_match and -"w" or "",
-- 	})
-- end

function _GREP_STRING_INPUT()
	builtin.grep_string({ search = vim.fn.input("Grep > "), case_sensitive = false, word_match = "-w" })
end
