require("nvim-surround").setup({
	keymaps = { -- vim-surround style keymaps
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "s",
		normal_cur = "ss",
		normal_line = "S",
		normal_cur_line = "SS",
		visual = "s",
		visual_line = "gS",
		delete = "ds",
		change = "cs",
	},
})
