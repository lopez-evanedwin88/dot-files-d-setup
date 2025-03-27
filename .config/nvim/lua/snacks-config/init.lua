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
	picker = {
		enabled = true,
		layout = {
			preset = "ivy",
		},
	},
	snippets = { enabled = true },
})

local snacks = require("snacks")

-- Existing keymaps
vim.keymap.set("n", "<leader><space>", function()
	snacks.picker.smart()
end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>N", function()
	snacks.win({
		file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
		width = 0.6,
		height = 0.6,
		wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 },
	})
end, { desc = "Neovim News" })
vim.keymap.set("n", "<leader>sg", function()
	snacks.picker.grep()
end, { desc = "Grep" })
vim.keymap.set({ "n", "x" }, "<leader>sw", function()
	snacks.picker.grep_word()
end, { desc = "Visual selection or word" })
vim.keymap.set("n", "<leader>/", function()
	snacks.picker.grep()
end, { desc = "Grep" })

-- New keymaps converted from Telescope
local keymaps = {
	ff = {
		function()
			snacks.picker.files({ hidden = true })
		end,
		"Find files",
	},
	ft = {
		function()
			snacks.picker.grep()
		end,
		"Grep string >",
	},
	fr = {
		function()
			snacks.picker.recent()
		end,
		"Recent Files",
	},
	fg = {
		function()
			snacks.picker.snippets()
		end,
		"Snip commands",
	},
}

-- Example: Register with vim.keymap.set (adjust prefixes as needed)
for key, map in pairs(keymaps) do
	vim.keymap.set("n", "<leader>" .. key, map[1], { desc = map[2] })
end
