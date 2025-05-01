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
		enabled = false,
		layout = {
			preset = "ivy",
		},
	},
	snippets = { enabled = true },
	notifier = { enabled = true },
})
