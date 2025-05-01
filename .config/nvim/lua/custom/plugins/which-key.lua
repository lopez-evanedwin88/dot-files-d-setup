local mappings = {

  ['<leader>k'] = { '<cmd>bdelete<CR>', 'Kill Buffer' }, -- Close current file
  ['<leader>p'] = { '<cmd>Lazy<CR>', 'Plugin Manager' }, -- Invoking plugin manager
  -- ['q'] = { '<cmd>wqall!<CR>', 'Quit' }, -- Quit Neovim after saving the file
  -- ['w'] = { '<cmd>w!<CR>', 'Save' }, -- Save current file

  -- LSP Config
  ['<leader>r'] = { '<cmd>lua vim.lsp.buf.format{async=true}<cr>', 'Reformat Code' },
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

  -- l = {
  --   -- Language Support
  --   l = {
  --     name = 'LSP',
  --     i = { '<cmd>LspInfo<cr>', 'Info' },
  --     r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
  --     s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },
  --     S = {
  --       '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
  --       'Workspace Symbols',
  --     },
  --   },
  --
  --   i = {
  --     name = 'Lspsaga',
  --     c = { '<cmd>Lspsaga code_action<cr>', 'Code Action' },
  --     o = { '<cmd>Lspsaga outline<cr>', 'Outline' },
  --     r = { '<cmd>Lspsaga rename<cr>', 'Rename' },
  --     d = { '<cmd>Lspsaga goto_definition<cr>', 'Lsp GoTo Definition' },
  --     f = { '<cmd>Lspsaga finder<cr>', 'Lsp Finder' },
  --     p = { '<cmd>Lspsaga preview_definition<cr>', 'Preview Definition' },
  --     s = { '<cmd>Lspsaga signature_help<cr>', 'Signature Help' },
  --     w = { '<cmd>Lspsaga show_workspace_diagnostics<cr>', 'Show Workspace Diagnostics' },
  --     K = { '<cmd>Lspsaga hover_doc<cr>', 'Go to / Display definition' },
  --   },
  --   s = {
  --     name = 'Flash',
  --     s = { "<cmd>lua require('flash').jump() <cr>", 'Flash Jump' },
  --     t = { "<cmd>lua require('flash').treesitter() <cr>", 'Flash Treesitter' },
  --     r = { "<cmd>lua require('flash').treesitter_search() <cr>", 'Flash Treesitter Search' },
  --   },
  -- },
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
