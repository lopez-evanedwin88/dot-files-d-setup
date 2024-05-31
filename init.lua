require('plugins')
require('lualine-config')
require('options')
require('treesitter-config')
require('bufferline-config')
require('nvim-web-devicons')
require('nvim-tree-config')
require('keymaps')
require('telescope-config') -- https://github.com/nvim-telescope/telescope.nvim
require('whichkey')
require('lsp')
require('undo-tree-config')
require('gitsigns-config')
require('toggle-term-config')
require('kanagawa-config')
require('lspsaga-config')


vim.diagnostic.config({
    virtual_text = false
})
vim.cmd("colorscheme kanagawa")
--vim.cmd("set fileformats=mac,unix,dos")
--vim.opt.termguicolors = true
--vim.cmd.colorscheme("nord")
