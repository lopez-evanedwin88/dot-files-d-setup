local kind_icons = {
	Text = "󰉿",
	Method = "m",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "󰆧",
	Class = "󰌗",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰇽",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰊄",
}

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local luasnip = require("luasnip")
luasnip.config.set_config({
	region_check_events = "InsertEnter",
	delete_check_events = "InsertLeave",
})
local cmp = require("cmp")
local types = require("cmp.types")
-- local icons = require("icons")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping(
			cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
			{ "i", "c" }
		),
		["<C-j>"] = cmp.mapping(
			cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
			{ "i", "c" }
		),
		["<C-p>"] = cmp.mapping(
			cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
			{ "i", "c" }
		),
		["<C-n>"] = cmp.mapping(
			cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
			{ "i", "c" }
		),
		["<C-h>"] = function()
			if cmp.visible_docs() then
				cmp.close_docs()
			else
				cmp.open_docs()
			end
		end,
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				-- fallback()
				require("neotab").tabout()
			else
				require("neotab").tabout()
				-- fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),
	-- formatting = {
	-- 	fields = { "kind", "abbr", "menu" },
	-- 	expandable_indicator = true,
	-- 	format = function(entry, vim_item)
	-- 		vim_item.kind = icons.kind[vim_item.kind]
	-- 		vim_item.menu = ({
	-- 			nvim_lsp = "",
	-- 			nvim_lua = "",
	-- 			luasnip = "",
	-- 			buffer = "",
	-- 			path = "",
	-- 			emoji = "",
	-- 		})[entry.source.name]
	--
	-- 		if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
	-- 			local duplicates = {
	-- 				buffer = 1,
	-- 				path = 1,
	-- 				nvim_lsp = 0,
	-- 				luasnip = 1,
	-- 			}
	--
	-- 			local duplicates_default = 0
	--
	-- 			vim_item.dup = duplicates[entry.source.name] or duplicates_default
	-- 		end
	--
	-- 		if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
	-- 			local words = {}
	-- 			for word in string.gmatch(vim_item.word, "[^-]+") do
	-- 				table.insert(words, word)
	-- 			end
	--
	-- 			local color_name, color_number
	-- 			if
	-- 				words[2] == "x"
	-- 				or words[2] == "y"
	-- 				or words[2] == "t"
	-- 				or words[2] == "b"
	-- 				or words[2] == "l"
	-- 				or words[2] == "r"
	-- 			then
	-- 				color_name = words[3]
	-- 				color_number = words[4]
	-- 			else
	-- 				color_name = words[2]
	-- 				color_number = words[3]
	-- 			end
	--
	-- 			if color_name == "white" or color_name == "black" then
	-- 				local color
	-- 				if color_name == "white" then
	-- 					color = "ffffff"
	-- 				else
	-- 					color = "000000"
	-- 				end
	--
	-- 				local hl_group = "lsp_documentColor_mf_" .. color
	-- 				-- vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
	-- 				vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "NONE" })
	-- 				vim_item.kind_hl_group = hl_group
	--
	-- 				-- make the color square 2 chars wide
	-- 				vim_item.kind = string.rep("▣", 1)
	--
	-- 				return vim_item
	-- 			elseif #words < 3 or #words > 4 then
	-- 				-- doesn't look like this is a tailwind css color
	-- 				return vim_item
	-- 			end
	--
	-- 			if not color_name or not color_number then
	-- 				return vim_item
	-- 			end
	--
	-- 			-- local color_index = tonumber(color_number)
	-- 			-- local tailwindcss_colors = require("tailwindcss-colorizer-cmp.colors").TailwindcssColors
	-- 			--
	-- 			-- if not tailwindcss_colors[color_name] then
	-- 			-- 	return vim_item
	-- 			-- end
	-- 			--
	-- 			-- if not tailwindcss_colors[color_name][color_index] then
	-- 			-- 	return vim_item
	-- 			-- end
	-- 			--
	-- 			-- local color = tailwindcss_colors[color_name][color_index]
	-- 			--
	-- 			-- local hl_group = "lsp_documentColor_mf_" .. color
	-- 			-- -- vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
	-- 			-- vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "NONE" })
	-- 			--
	-- 			-- vim_item.kind_hl_group = hl_group
	--
	-- 			-- make the color square 2 chars wide
	-- 			vim_item.kind = string.rep("▣", 1)
	--
	-- 			-- return vim_item
	-- 		end
	--
	-- 		if entry.source.name == "copilot" then
	-- 			vim_item.kind = icons.git.Octoface
	-- 			vim_item.kind_hl_group = "CmpItemKindCopilot"
	-- 		end
	--
	-- 		if entry.source.name == "cmp_tabnine" then
	-- 			vim_item.kind = icons.misc.Robot
	-- 			vim_item.kind_hl_group = "CmpItemKindTabnine"
	-- 		end
	--
	-- 		if entry.source.name == "crates" then
	-- 			vim_item.kind = icons.misc.Package
	-- 			vim_item.kind_hl_group = "CmpItemKindCrate"
	-- 		end
	--
	-- 		if entry.source.name == "lab.quick_data" then
	-- 			vim_item.kind = icons.misc.CircuitBoard
	-- 			vim_item.kind_hl_group = "CmpItemKindConstant"
	-- 		end
	--
	-- 		if entry.source.name == "emoji" then
	-- 			vim_item.kind = icons.misc.Smiley
	-- 			vim_item.kind_hl_group = "CmpItemKindEmoji"
	-- 		end
	--
	-- 		return require("nvim-highlight-colors").format(entry, vim_item)
	-- 	end,
	-- },
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			-- return require("nvim-highlight-colors").format(entry, vim_item)
      return vim_item
		end,
	},
	sources = {
		{
			name = "nvim_lsp",
			entry_filter = function(entry, ctx)
				local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
				if kind == "Snippet" and ctx.prev_context.filetype == "java" then
					return false
				end

				if ctx.prev_context.filetype == "markdown" then
					return true
				end

				if kind == "Text" then
					return false
				end

				return true
			end,
		},
		{ name = "luasnip" },
		{ name = "cmp_tabnine" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "calc" },
		{ name = "emoji" },
		{ name = "treesitter" },
		{ name = "crates" },
		{ name = "tmux" },
		{ name = "vim-dadbod-completion" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	view = {
		entries = {
			name = "custom",
			selection_order = "top_down",
		},
		docs = {
			auto_open = false,
		},
	},
	-- window = {
	-- 	completion = {
	-- 		border = "rounded",
	-- 		winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
	-- 		col_offset = -3,
	-- 		side_padding = 1,
	-- 		scrollbar = false,
	-- 		scrolloff = 8,
	-- 	},
	-- 	documentation = {
	-- 		border = "rounded",
	-- 		winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
	-- 	},
	-- },
	experimental = {
		ghost_text = false,
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

require("luasnip/loaders/from_vscode").load({ include = { "vue" } })
require("luasnip").filetype_extend("typescript", { "tsdoc" })
require("luasnip").filetype_extend("javascript", { "jsdoc" })
require("luasnip.loaders.from_vscode").lazy_load()
