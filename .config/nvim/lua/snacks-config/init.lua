require("snacks").setup({
	image = {
		formats = {
			"png",
			"jpg",
			"jpeg",
			"gif",
			"bmp",
			"webp",
			"tiff",
			"heic",
			"avif",
			"mp4",
			"mov",
			"avi",
			"mkv",
			"webm",
			"pdf",
		},
		force = false, -- try displaying the image, even if the terminal does not support it
		doc = {
			enabled = true,
			inline = true,
			float = true,
		},
	},
})

local snacks = require("snacks")

vim.keymap.set("n", "<leader><space>", function()
	snacks.picker.smart()
end, { desc = "Smart Find Files" })

-- Open Neovim news
vim.keymap.set("n", "<leader>N", function()
	snacks.win({
		file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
		width = 0.6,
		height = 0.6,
		wo = {
			spell = false,
			wrap = false,
			signcolumn = "yes",
			statuscolumn = " ",
			conceallevel = 3,
		},
	})
end, { desc = "Neovim News" })

-- Grep commands
vim.keymap.set("n", "<leader>sg", function()
	snacks.picker.grep()
end, { desc = "Grep" })
vim.keymap.set({ "n", "x" }, "<leader>sw", function()
	snacks.picker.grep_word()
end, { desc = "Visual selection or word" })
vim.keymap.set("n", "<leader>/", function()
	snacks.picker.grep()
end, { desc = "Grep" })
