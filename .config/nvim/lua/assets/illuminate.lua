require("illuminate").configure({
	providers = {
		"lsp",
		"treesitter",
	},
	filetypes_denylist = {
		"mason",
		"harpoon",
		"NeogitCommitMessage",
		"minifiles",
		"fugitive",
		"alpha",
		"NvimTree",
		"lazy",
		"NeogitStatus",
		"netrw",
		"lir",
		"DiffviewFiles",
		"Outline",
		"Jaq",
		"toggleterm",
		"TelescopePrompt",
	},
})

-- change the highlight style
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

--- auto update the highlight style on colorscheme change
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	pattern = { "*" },
	callback = function(ev)
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
	end,
})
