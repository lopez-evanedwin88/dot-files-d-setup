require("noice").setup({
	messages = {
		enabled = false, -- enables the Noice messages UIview
		view = "cmdline_popup",
	},
	-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
	override = {
		["vim.lsp.util.convert_input_to_markdown_lines"] = true,
		["vim.lsp.util.stylize_markdown"] = true,
		["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
	},
	routes = {
		{
			view = "notify",
			filter = { event = "msg_showmode" },
		},
		{
			filter = {
				event = "msg_show",
				any = {
					{ find = "%d+L, %d+B" },
					{ find = "; after #%d+" },
					{ find = "; before #%d+" },
					{ find = "%d+ fewer lines" },
					{ find = "%d+ lines changed" },
					{ find = "%d+ more lines" },
					{ find = "%d+ lines yanked" },
					{ find = "search hit %a+, continuing at %a+" },
					{ find = "%d+ lines <ed %d+ time" },
					{ find = "%d+ lines >ed %d+ time" },
					{ find = "%d+ substitutions on %d+ lines" },
					{ find = "Hunk %d+ of %d+" },
					{ find = "%-%-No lines in buffer%-%-" },
					{ find = "^E486: Pattern not found" },
					{ find = "^Word .*%.add$" },
					{ find = "^E486" },
					{ find = "^E42" },
					{ find = "^E776" },
					{ find = "^E348" },
					{ find = "^W325" },
					{ find = "^E1513" },
					{ find = "^E553" },
					{ find = "E211: File .* no longer available" },
					{ find = "No more valid diagnostics to move to" },
				},
			},
			view = "mini",
		},
		{
			filter = {
				event = "notify",
				--@param msg NoiceMessage
				cond = function(msg)
					local title = msg.opts and msg.opts.title or ""
					return vim.tbl_contains({ "mason" }, title)
				end,
			},
			view = "mini",
		},
		{
			filter = {
				event = "notify",
				kind = { "debug", "trace" },
			},
			opts = {
				timeout = 5000,
			},
			view = "mini",
		},
	},
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

vim.keymap.set("c", "<S-Enter>", function()
	require("noice").redirect(vim.fn.getcmdline())
end, { desc = "Redirect Cmdline" })

vim.keymap.set("n", "<leader>nl", function()
	require("noice").cmd("last")
end)

vim.keymap.set("n", "<leader>nh", function()
	require("noice").cmd("history")
end)

vim.notify = require("notify")
