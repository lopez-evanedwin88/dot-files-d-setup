require("mini.files").setup({
	-- Same config options as before
	mappings = {
		close = "q",
		go_in = "l",
		go_in_plus = "<CR>",
		go_out = "h",
		go_out_plus = "<BS>",
		reset = "<C-r>",
		reveal_cwd = "@",
		show_help = "g?",
		synchronize = "s",
		trim_left = "<",
		trim_right = ">",
	},
	options = {
		permanent_delete = false,
		use_as_default_explorer = true,
	},
	windows = {
		preview = true,
		width_focus = 30,
		width_nofocus = 15,
		width_preview = 50,
	},
})

vim.keymap.set("n", "-", function()
	require("mini.files").open(vim.uv.cwd(), true)
end, { desc = "Open Mini Files" })

vim.keymap.set("n", "<leader>-", function()
	local buf_path = vim.api.nvim_buf_get_name(0)
	require("mini.files").open(buf_path ~= "" and vim.fn.fnamemodify(buf_path, ":p:h") or vim.uv.cwd(), true)
end, { desc = "Open Mini Files at Current File" })
