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
			theme = "ivy",
			file_ignore_patterns = { "node_modules", ".git", ".venv" },
			hidden = true,
		},
		oldfiles = {
			theme = "ivy",
		},
		live_grep = {
			theme = "ivy",
		},
		git_files = {
			theme = "ivy",
		},
    git_commits = {
      theme = "ivy",
    },
    git_branches = {
      theme = "ivy",
    },
    git_status = {
      theme = "ivy",
    },
    git_bcommits = {
      theme = "ivy",
    },
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
		fzf = {
			fuzzy = false, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
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

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

function LOVE_MULTIGREP(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()

	local finder = finders.new_async_job({
		command_generator = function(prompt)
			if not prompt or prompt == "" then
				return nil
			end

			local pieces = vim.split(prompt, "  ")
			local args = { "rg" }
			if pieces[1] then
				table.insert(args, "-e")
				table.insert(args, pieces[1])
			end

			if pieces[2] then
				table.insert(args, "-g")
				table.insert(args, pieces[2])
			end

			---@diagnostic disable-next-line: deprecated
			return vim.tbl_flatten({
				args,
				{ "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
			})
		end,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		cwd = opts.cwd,
	})

	pickers
		.new(opts, {
			debounce = 100,
			prompt_title = "Multi Grep",
			finder = finder,
			previewer = conf.grep_previewer(opts),
			sorter = require("telescope.sorters").empty(),
		})
		:find()
end

-- vim.keymap.set("n", "<leader>fv", live_multigrep)
