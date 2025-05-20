-- local status_ok, which_key = pcall(require, "which-key")
-- if not status_ok then
-- 	return
-- end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = 'rounded', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = 'left', -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  -- triggers = { "<leader>" }, -- or specify a list manually
  triggers = {
    { '<auto>', mode = 'nxso' },
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { 'j', 'k' },
    v = { 'j', 'k' },
  },
}

-- local opts = {
-- 	mode = "n", -- NORMAL mode
-- 	prefix = "<leader>",
-- 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
-- 	silent = true, -- use `silent` when creating keymaps
-- 	noremap = true, -- use `noremap` when creating keymaps
-- 	nowait = true, -- use `nowait` when creating keymaps
-- }

-- local mappings = {
--
-- 	["k"] = { "<cmd>bdelete<CR>", "Kill Buffer" }, -- Close current file
-- 	["p"] = { "<cmd>Lazy<CR>", "Plugin Manager" }, -- Invoking plugin manager
-- 	["q"] = { "<cmd>wqall!<CR>", "Quit" }, -- Quit Neovim after saving the file
-- 	["w"] = { "<cmd>w!<CR>", "Save" }, -- Save current file
--
-- 	-- LSP Config
-- 	["r"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Reformat Code" },
-- 	["m"] = { "<cmd>Mason<cr>", "Mason" }, -- LSP Manager
-- 	-- Undo tree
-- 	-- ["u"] = { "<cmd>lua require('undotree').toggle()<CR>", "Undo-Tree" }, -- Undo History
--
-- 	-- Display all buffer
-- 	["bb"] = { "<cmd>Telescope buffers<cr>", "Find" },
--
-- 	--Dimiss noice
-- 	["nd"] = { "<cmd>NoiceDismiss<cr>", "Dimiss Noice Message" },
--
-- 	--Toggle Term
-- 	t = {
-- 		name = "Terminal",
-- 		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" }, -- Node Terminal
-- 		-- t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" }, -- (Optional) Htop, If you have htop in linux
-- 		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" }, -- Python Terminal
-- 		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" }, -- Floating Terminal
--
-- 		-- Play with size according to your needs.
-- 		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, -- Horizontal Terminal,
-- 		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" }, -- Vertical Terminal
-- 	},
--
-- 	--Git
-- 	g = {
-- 		name = "Git",
-- 		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
-- 		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
-- 		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
-- 		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
-- 		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
-- 		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
-- 		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
-- 		u = {
-- 			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
-- 			"Undo Stage Hunk",
-- 		},
-- 		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
-- 		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
-- 		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
-- 		f = { "<cmd>Telescope git_bcommits<cr>", "Checkout current files commit's" },
-- 		d = {
-- 			"<cmd>Gitsigns diffthis HEAD<cr>",
-- 			"Diff",
-- 		},
-- 		g = {
-- 			name = "Git dependencies",
-- 			g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" }, -- LazyGit UI
-- 			s = { "<cmd>Git<cr>", "Fugitive" }, -- Fugitive
-- 		},
-- 	},
--
-- 	l = {
-- 		-- Language Support
-- 		l = {
-- 			name = "LSP",
-- 			i = { "<cmd>LspInfo<cr>", "Info" },
-- 			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
-- 			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
-- 			S = {
-- 				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
-- 				"Workspace Symbols",
-- 			},
-- 		},
--
-- 		i = {
-- 			name = "Lspsaga",
-- 			c = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
-- 			o = { "<cmd>Lspsaga outline<cr>", "Outline" },
-- 			r = { "<cmd>Lspsaga rename<cr>", "Rename" },
-- 			d = { "<cmd>Lspsaga goto_definition<cr>", "Lsp GoTo Definition" },
-- 			f = { "<cmd>Lspsaga finder<cr>", "Lsp Finder" },
-- 			p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
-- 			s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
-- 			w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics" },
-- 			K = { "<cmd>Lspsaga hover_doc<cr>", "Go to / Display definition" },
-- 		},
-- 		s = {
-- 			name = "Flash",
-- 			s = { "<cmd>lua require('flash').jump() <cr>", "Flash Jump" },
-- 			t = { "<cmd>lua require('flash').treesitter() <cr>", "Flash Treesitter" },
-- 			r = { "<cmd>lua require('flash').treesitter_search() <cr>", "Flash Treesitter Search" },
-- 		},
-- 	},
-- 	-- Telescope
-- 	f = {
-- 		name = "File Search",
-- 		e = { "<cmd>Telescope resume<cr>", "Resume last search" },
-- 		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
-- 		f = { "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>", "Find files" },
-- 		g = { "<cmd>Telescope live_grep<cr>", "Find Text Pattern" },
-- 		-- t = { "<cmd>lua _GREP_STRING_INPUT()<cr>", "Grep string >" },
-- 		v = { "<cmd>lua LOVE_MULTIGREP()<cr>", "Multi grep.." },
-- 		r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
-- 		t = { "<cmd>Telescope luasnip<cr>", "Snip commands" },
-- 	},
--
-- 	s = {
-- 		name = "Search",
-- 		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
-- 		m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
-- 		r = { "<cmd>Telescope registers<cr>", "Registers" },
-- 		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
-- 		c = { "<cmd>Telescope commands<cr>", "Commands" },
-- 	},
--
-- 	o = {
-- 		name = "Command preferences",
-- 		p = { "<cmd>lua print(vim.fn.expand('%:p')) <cr>", "Absolute Path" },
-- 	},
-- }

-- which_key.setup(setup)
-- which_key.register(mappings, opts)

local mappings = {

  ['<leader>k'] = { '<cmd>bdelete<CR>', 'Kill Buffer' }, -- Close current file
  ['<leader>p'] = { '<cmd>Lazy<CR>', 'Plugin Manager' }, -- Invoking plugin manager
  -- ['q'] = { '<cmd>wqall!<CR>', 'Quit' }, -- Quit Neovim after saving the file
  -- ['w'] = { '<cmd>w!<CR>', 'Save' }, -- Save current file

  -- LSP Config
  ['<leader>r'] = { "<cmd>lua require 'conform'.format({async = true}, _AFTER_FORMATTING)<cr>", 'Reformat Code' },
  ['<leader>m'] = { '<cmd>Mason<cr>', 'Mason' }, -- LSP Manager
  -- Undo tree
  -- ["u"] = { "<cmd>lua require('undotree').toggle()<CR>", "Undo-Tree" }, -- Undo History

  -- Display all buffer
  -- ['bb'] = { '<cmd>Telescope buffers<cr>', 'Find' },

  --Dimiss noice
  -- ['nd'] = { '<cmd>NoiceDismiss<cr>', 'Dimiss Noice Message' },

  --Toggle Term
  ['<leader>t'] = {
    name = 'Terminal',
    n = { '<cmd>lua _NODE_TOGGLE()<cr>', 'Node' }, -- Node Terminal
    -- t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" }, -- (Optional) Htop, If you have htop in linux
    p = { '<cmd>lua _PYTHON_TOGGLE()<cr>', 'Python' }, -- Python Terminal
    f = { '<cmd>ToggleTerm direction=float<cr>', 'Float' }, -- Floating Terminal

    -- Play with size according to your needs.
    h = { '<cmd>ToggleTerm size=10 direction=horizontal<cr>', 'Horizontal' }, -- Horizontal Terminal,
    v = { '<cmd>ToggleTerm size=80 direction=vertical<cr>', 'Vertical' }, -- Vertical Terminal
  },

  --Git
  ['<leader>g'] = {
    name = 'Git',
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", 'Next Hunk' },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", 'Prev Hunk' },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", 'Blame' },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", 'Preview Hunk' },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", 'Reset Hunk' },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", 'Reset Buffer' },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", 'Stage Hunk' },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      'Undo Stage Hunk',
    },
    o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
    b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
    c = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
    f = { '<cmd>Telescope git_bcommits<cr>', "Checkout current files commit's" },
    d = {
      '<cmd>Gitsigns diffthis HEAD<cr>',
      'Diff',
    },
    g = {
      name = 'Git dependencies',
      g = { '<cmd>lua _LAZYGIT_TOGGLE()<cr>', 'LazyGit' }, -- LazyGit UI
      s = { '<cmd>Git<cr>', 'Fugitive' }, -- Fugitive
    },
  },
  ['<leader>l'] = {
    -- Language Support
    l = {
      name = 'LSP',
      i = { '<cmd>LspInfo<cr>', 'Info' },
      r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
      s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },
      S = {
        '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
        'Workspace Symbols',
      },
    },

    i = {
      name = 'Lspsaga',
      c = { '<cmd>Lspsaga code_action<cr>', 'Code Action' },
      o = { '<cmd>Lspsaga outline<cr>', 'Outline' },
      r = { '<cmd>Lspsaga rename<cr>', 'Rename' },
      d = { '<cmd>Lspsaga goto_definition<cr>', 'Lsp GoTo Definition' },
      f = { '<cmd>Lspsaga finder<cr>', 'Lsp Finder' },
      p = { '<cmd>Lspsaga preview_definition<cr>', 'Preview Definition' },
      s = { '<cmd>Lspsaga signature_help<cr>', 'Signature Help' },
      w = { '<cmd>Lspsaga show_workspace_diagnostics<cr>', 'Show Workspace Diagnostics' },
      K = { '<cmd>Lspsaga hover_doc<cr>', 'Go to / Display definition' },
    },
  },

  -- Telescope
  ['<leader>f'] = {
    name = 'File Search',
    e = { '<cmd>Telescope resume<cr>', 'Resume last search' },
    c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
    f = { "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>", 'Find files' },
    g = { '<cmd>Telescope live_grep<cr>', 'Find Text Pattern' },
    -- t = { "<cmd>lua _GREP_STRING_INPUT()<cr>", "Grep string >" },
    v = { '<cmd>lua LOVE_MULTIGREP()<cr>', 'Multi grep..' },
    r = { '<cmd>Telescope oldfiles<cr>', 'Recent Files' },
    t = { '<cmd>Telescope luasnip<cr>', 'Snip commands' },
  },

  --Flash
  ['s'] = {
    name = 'Flash',
    s = { "<cmd>lua require('flash').jump() <cr>", 'Flash Jump' },
    t = { "<cmd>lua require('flash').treesitter() <cr>", 'Flash Treesitter' },
    r = { "<cmd>lua require('flash').treesitter_search() <cr>", 'Flash Treesitter Search' },
  },

  -- Telescope
  -- f = {
  --   name = 'File Search',
  --   e = { '<cmd>Telescope resume<cr>', 'Resume last search' },
  --   c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
  --   f = { "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>", 'Find files' },
  --   t = { '<cmd>Telescope live_grep<cr>', 'Find Text Pattern' },
  --   -- t = { "<cmd>lua _GREP_STRING_INPUT()<cr>", "Grep string >" },
  --   v = { '<cmd>lua LOVE_MULTIGREP()<cr>', 'Multi grep..' },
  --   r = { '<cmd>Telescope oldfiles<cr>', 'Recent Files' },
  --   g = { '<cmd>Telescope luasnip<cr>', 'Snip commands' },
  -- },
  --
  -- s = {
  --   name = 'Search',
  --   h = { '<cmd>Telescope help_tags<cr>', 'Find Help' },
  --   m = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
  --   r = { '<cmd>Telescope registers<cr>', 'Registers' },
  --   k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
  --   c = { '<cmd>Telescope commands<cr>', 'Commands' },
  -- },
  --
  -- o = {
  --   name = 'Command preferences',
  --   p = { "<cmd>lua print(vim.fn.expand('%:p')) <cr>", 'Absolute Path' },
  -- },
}

return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.opt.timeoutlen
    delay = 0,
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },

    -- Document existing key chains
    spec = {
      { '<leader>f', group = '[F]ind' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)

    wk.register(mappings, { mode = { 'n', 'v' } })
  end,
}
