vim.opt.showtabline = 3

local theme = {
	fill = {},
	head = "TabLine",
	-- current_tab = "TabLineSel",
	current_tab = { fg = "#F8FBF6", bg = "#896a98", style = "italic" },
	tab = "TabLine",
	win = "TabLine",
	tail = "TabLine",
}

require("tabby").setup({
	line = function(line)
		return {
			{
				{ "  ", hl = theme.head },
				line.sep("", theme.head, theme.fill),
				-- line.sep(" ", theme.head, theme.fill),
			},
			line.tabs().foreach(function(tab)
				local hl = tab.is_current() and theme.current_tab or theme.tab
				return {
					-- line.sep("", hl, theme.fill),
					line.sep("", hl, theme.fill),
					-- tab.is_current() and "" or "",
					tab.is_current() and "" or "",
					tab.number(),
					tab.name(),
					tab.close_btn("󰅖 "),
					-- window_count(tab),
					-- change_mark(tab),
					-- line.sep(" ", hl, theme.fill),
					line.sep(" ", hl, theme.fill),
					hl = hl,
					margin = " ",
				}
			end),
			line.spacer(),
			-- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
			--   return {
			--     line.sep("", theme.win, theme.fill),
			--     win.is_current() and "" or "",
			--     win.buf_name(),
			--     line.sep("", theme.win, theme.fill),
			--     hl = theme.win,
			--     margin = " ",
			--   }
			-- end),
			{
				line.sep("", theme.tail, theme.fill),
				{ "  ", hl = theme.tail },
			},
			hl = theme.fill,
		}
	end,
})
