local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "wbthomason/packer.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = { "BufReadPre", "BufNewFile" } },
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			"nvim-telescope/telescope-ui-select.nvim",

			-- Useful for getting pretty icons, but requires a Nerd Font.
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP SUpport
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "saadparwaiz1/cmp_luasnip" },
			-- { "saghen/blink.cmp" }

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	{
		"benfowler/telescope-luasnip.nvim",
	},
	-- {
	-- 	"jiaoshijie/undotree",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- Themes
	{ "rebelot/kanagawa.nvim" },
	{ "shaunsingh/nord.nvim" },
	{
		"vague2k/vague.nvim",
	},
	{ "folke/tokyonight.nvim" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "embark-theme/vim" },

	{
		"folke/noice.nvim",
		lazy = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{ "nvimdev/lspsaga.nvim" },
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{ "tpope/vim-fugitive" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	dependencies = {
	-- 		{
	-- 			"s1n7ax/nvim-window-picker",
	-- 			version = "2.*",
	-- 			config = function()
	-- 				require("window-picker").setup({
	-- 					filter_rules = {
	-- 						include_current_win = false,
	-- 						autoselect_one = true,
	-- 						-- filter using buffer options
	-- 						bo = {
	-- 							-- if the file type is one of following, the window will be ignored
	-- 							filetype = { "neo-tree", "neo-tree-popup", "notify" },
	-- 							-- if the buffer type is one of following, the window will be ignored
	-- 							buftype = { "terminal", "quickfix" },
	-- 						},
	-- 					},
	-- 				})
	-- 			end,
	-- 		},
	-- 	},
	-- },
	{
		"numToStr/Comment.nvim",
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},
	{
		"0x100101/lab.nvim",
		-- cmd = "cd js && npm ci", -- or install if manually
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- Highlights colors
	{
		"RRethy/vim-illuminate",
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
	},
	{
		"stevearc/oil.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"folke/flash.nvim",
	},
	{
		-- debugger adapter plugin manager
		"jay-babu/mason-nvim-dap.nvim",
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			-- debugger adapter plugins
			"mxsdev/nvim-dap-vscode-js",
			"mfussenegger/nvim-dap-python",
		},
	},
	{
		"microsoft/vscode-js-debug",
		-- After install, build it and rename the dist directory to out
		build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
		version = "1.*",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
	},
	{
		"windwp/nvim-autopairs",
	},
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	dependencies = {
	-- 		"zbirenbaum/copilot-cmp",
	-- 	},
	-- },
	-- {
	-- 	"jinh0/eyeliner.nvim",
	-- },
	{
		"andymass/vim-matchup",
		setup = function()
			vim.g.matchup_matchparen_offscreen = { method = nil }
			vim.g.matchup_matchpref = { html = { nolists = 1 } }
		end,
	},
	{
		"karb94/neoscroll.nvim",
		commit = "e786577",
	},
	{ "nacro90/numb.nvim", event = "VeryLazy" },
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
	},
	-- {
	-- 	"nanozuki/tabby.nvim",
	-- 	event = "VeryLazy",
	-- },
	{
		"kawre/neotab.nvim",
		event = "InsertEnter",
	},
	-- {
	-- 	"ibhagwan/fzf-lua",
	-- },
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true, silent = true })
		end,
	},
	-- {
	--   "brenoprata10/nvim-highlight-colors",
	-- },
	{
		"norcalli/nvim-colorizer.lua",
	},
	{ "tjdevries/colorbuddy.nvim" },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	},
	{
		"mg979/vim-visual-multi",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_save_location = "~/.config/nvim/db_connections.json" -- Save location
			-- vim.g.db_ui_win_position = "right"
			vim.g.db_ui_win_width = 100 -- Set width in columns
		end,
	},
	-- {
	-- 	"ramilito/kubectl.nvim",
	-- 	config = function()
	-- 		require("kubectl").setup()
	-- 	end,
	-- },
	{
		"echasnovski/mini.indentscope",
	},
	{
		"GitMarkedDan/you-are-an-idiot.nvim",
	},
	{
		"sphamba/smear-cursor.nvim",
	},
	{
		"wojciech-kulik/xcodebuild.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"j-hui/fidget.nvim",
	},
	{
		"folke/snacks.nvim",
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.files",
		version = false, -- Use latest commit (or pin with "1.*" for stability)
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "BufReadPost", -- Load after opening a buffer
	},
})
