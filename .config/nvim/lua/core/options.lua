-- -- Set <space> as the leader key
-- -- See `:help mapleader`
-- --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '
--
-- -- Set to true if you have a Nerd Font installed and selected in the terminal
-- vim.g.have_nerd_font = false
--
-- -- [[ Setting options ]]
-- -- See `:help vim.opt`
-- -- NOTE: You can change these options as you wish!
-- --  For more options, you can see `:help option-list`
--
-- -- Make line numbers default
-- vim.opt.number = true
-- -- You can also add relative line numbers, to help with jumping.
-- --  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true
--
-- -- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.mouse = 'a'
--
-- -- Don't show the mode, since it's already in the status line
-- vim.opt.showmode = false
--
-- -- Sync clipboard between OS and Neovim.
-- --  Schedule the setting after `UiEnter` because it can increase startup-time.
-- --  Remove this option if you want your OS clipboard to remain independent.
-- --  See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)
--
-- -- Enable break indent
-- vim.opt.breakindent = true
--
-- -- Save undo history
-- vim.opt.undofile = true
--
-- -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
--
-- -- Keep signcolumn on by default
-- vim.opt.signcolumn = 'yes'
--
-- -- Decrease update time
-- vim.opt.updatetime = 250
--
-- -- Decrease mapped sequence wait time
-- vim.opt.timeoutlen = 300
--
-- -- Configure how new splits should be opened
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true
--
-- -- Sets how neovim will display certain whitespace characters in the editor.
-- --  See `:help 'list'`
-- --  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
--
-- -- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'split'
--
-- -- Show which line your cursor is on
-- vim.opt.cursorline = true
--
-- -- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.scrolloff = 10
--
-- -- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- -- instead raise a dialog asking if you wish to save the current file(s)
-- -- See `:help 'confirm'`
-- vim.opt.confirm = true
--
-- -- [[ Basic Keymaps ]]
-- --  See `:help vim.keymap.set()`
--
-- -- Clear highlights on search when pressing <Esc> in normal mode
-- --  See `:help hlsearch`
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
--
-- -- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
--
-- -- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- -- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- -- is not what someone will guess without a bit more experience.
-- --
-- -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- -- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
--
-- -- TIP: Disable arrow keys in normal mode
-- -- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- -- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- -- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- -- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
--
-- -- Keybinds to make split navigation easier.
-- --  Use CTRL+<hjkl> to switch between windows
-- --
-- --  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--
-- -- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- -- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- -- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- -- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- -- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- This file is from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- LazyVim auto format
vim.g.autoformat = true

-- LazyVim picker to use.
-- Can be one of: telescope, fzf
-- Leave it to "auto" to automatically use the picker
-- enabled with `:LazyExtras`
vim.g.lazyvim_picker = 'auto'

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { 'lsp', { '.git', 'lua' }, 'cwd' }

-- LazyVim automatically configures lazygit:
--  * theme, based on the active colorscheme.
--  * editorPreset to nvim-remote
--  * enables nerd font icons
-- Set to false to disable.
vim.g.lazygit_config = true

-- Options for the LazyVim statuscolumn
vim.g.lazyvim_statuscolumn = {
  folds_open = false, -- show fold sign when fold is open
  folds_githl = false, -- highlight fold sign with git sign color
}

-- Optionally setup the terminal to use
-- This sets `vim.o.shell` and does some additional configuration for:
-- * pwsh
-- * powershell
-- LazyVim.terminal.setup("pwsh")

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
-- mini.animate will also be disabled.
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

-- Show the current document symbols location from Trouble in lualine
vim.g.trouble_lualine = true

local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus' -- Sync with system clipboard
opt.completeopt = 'menu,menuone,noselect'
-- opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
opt.foldlevel = 99
-- opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = 'jcroqlnt' -- tcqj
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.ignorecase = true -- Ignore case
opt.inccommand = 'nosplit' -- preview incremental substitute
opt.jumpoptions = 'view'
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = 'a' -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
-- opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { 'en' }
opt.spelloptions:append 'noplainbuffer'
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = 'screen'
opt.splitright = true -- Put new windows right of current
-- opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

opt.hlsearch = true -- Set highlight on search
opt.autoindent = true -- copy indent from current line when starting new one
opt.backspace = 'indent,eol,start' -- allow backspace on
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages

-- if vim.fn.has 'nvim-0.10' == 1 then
--   opt.smoothscroll = true
--   opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
--   opt.foldmethod = 'expr'
--   opt.foldtext = ''
-- else
--   opt.foldmethod = 'indent'
--   opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
-- end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

return {}
