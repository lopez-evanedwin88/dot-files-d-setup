require("fzf-lua").setup({
	fzf_opts = {
		["--layout"] = "reverse-list",
	},
	oldfiles = {
		include_current_session = true,
	},
})
