local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Allow moving the cursor through wrapped lines with j, k
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
keymap('n', '<Esc>', ':noh<CR>', opts)

-- save file
keymap('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
keymap('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
keymap('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
keymap('n', 'x', '"_x', opts)
-- navigate buffers
keymap('n', '<Tab>', ':bnext<cr>', opts) -- Next Tab
keymap('n', '<S-Tab>', ':bprevious<cr>', opts) -- Previous tab
keymap('n', '<leader>h', ':nohlsearch<cr>', opts) -- No highlight search

-- move text up and down
keymap('n', '<a-j>', '<esc>:m .+1<cr>==gi', opts) -- Alt-j
keymap('n', '<a-k>', '<esc>:m .-2<cr>==gi', opts) -- Alt-k

-- insert --
-- press jk fast to exit insert mode
keymap('i', 'jk', '<esc>', opts) -- Insert mode -> jk -> Normal mode
keymap('i', 'kj', '<esc>', opts) -- Insert mode -> kj -> Normal mode

-- visual --
-- stay in indent mode
keymap('v', '<', '<gv', opts) -- Right Indentation
keymap('v', '>', '>gv', opts) -- Left Indentation

-- move text up and down
keymap('v', '<a-j>', ':m .+1<cr>==', opts) -- Alt-j
keymap('v', '<a-k>', ':m .-2<cr>==', opts) -- Alt-k

-- Visual Block --
-- Move text up and down
--Terminal --
keymap('x', 'J', ":move '>+1<CR>gv=gv", opts) -- Change to gv=gv to auto indent
keymap('x', 'K', ":move '<-2<CR>gv=gv", opts) -- Change to gv=gv to auto indent
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts) -- Alt-j
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts) -- Alt-k

--Better terminal navigation
keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', opts)
keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', opts)
keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', opts)
keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', opts)

--Remaps from ThePrimeagen
keymap('n', 'J', 'mzJ`z', opts)
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

keymap('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
-- keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, opts) -- For creating bash scripts

keymap('n', '<leader>d', [["_d]], opts)
keymap('v', '<leader>d', [["_d]], opts)
-- keymap("x", "<leader>P", [["_dP]], opts) -- or "P"
keymap('n', '<leader>y', [["+y]], opts)
keymap('v', '<leader>y', [["+y]], opts)
keymap('n', '<leader>Y', [["+Y]], opts)

-- Resize with arrows
keymap('n', '<Up>', ':resize -2<CR>', opts)
keymap('n', '<Down>', ':resize +2<CR>', opts)
keymap('n', '<Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<Right>', ':vertical resize +2<CR>', opts)

-- window management
keymap('n', '<leader>v', '<C-w>v', opts) -- split window vertically
keymap('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
keymap('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
keymap('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- -- tabs
-- keymap('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
-- keymap('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
-- keymap('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
-- keymap('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab
--
-- keymap('n', '<leader>x', ':Bdelete!<CR>', opts) -- close buffer
-- keymap('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer
--
-- toggle line wrapping
keymap('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Keep last yanked when pasting
keymap('v', 'p', '"_dP', opts)

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Save and load session
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })

--Move to specific buffer tab
vim.keymap.set('n', '<leader>1', "<cmd>lua require'bufferline'.go_to(1, true)<cr>", { noremap = true, silent = false })
vim.keymap.set('n', '<leader>2', "<cmd>lua require'bufferline'.go_to(2, true)<cr>", { noremap = true, silent = false })
vim.keymap.set('n', '<leader>3', "<cmd>lua require'bufferline'.go_to(3, true)<cr>", { noremap = true, silent = false })
vim.keymap.set('n', '<leader>4', "<cmd>lua require'bufferline'.go_to(4, true)<cr>", { noremap = true, silent = false })
vim.keymap.set('n', '<leader>5', "<cmd>lua require'bufferline'.go_to(5, true)<cr>", { noremap = true, silent = false })
vim.keymap.set('n', '<leader>6', "<cmd>lua require'bufferline'.go_to(6, true)<cr>", { noremap = true, silent = false })

-- Use an expression mapping to simulate i% and a% as text objects
vim.keymap.set('n', 'zz', function()
  vim.cmd 'normal z%'
end, { noremap = true, silent = true })
-- Map zi to i% (inner match) in normal, operator-pending, and visual modes
vim.keymap.set({ 'n', 'o', 'x' }, 'zi', function()
  vim.cmd 'normal i%'
end, { noremap = true, silent = true })

-- Map za to a% (around match) in normal, operator-pending, and visual modes
vim.keymap.set({ 'n', 'o', 'x' }, 'za', function()
  vim.cmd 'normal a%'
end, { noremap = true, silent = true })
