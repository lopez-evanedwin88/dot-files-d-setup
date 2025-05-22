local icons = require 'assets.icons'

-- Set the highlight for focus and unfocus
vim.cmd [[
	augroup IndentBlankline
	autocmd!
	autocmd FocusGained,BufEnter * highlight IndentBlanklineChar guifg=NONE
	autocmd FocusLost,BufLeave * highlight IndentBlanklineChar guifg=#888888
	augroup END
]]

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'help',
    'alpha',
    'dashboard',
    'neo-tree',
    'Trouble',
    'trouble',
    'lazy',
    'mason',
    'notify',
    'toggleterm',
    'lazyterm',
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

return {
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   config = function()
  --     require('ibl').setup {
  --       indent = {
  --         char = icons.ui.LineLeft, -- Use a simple vertical line for indentation
  --         -- highlight = "IndentBlanklineChar", -- Use a highlight group
  --       },
  --       whitespace = {
  --         highlight = nil, -- Disable highlight for whitespace
  --         remove_blankline_trail = false,
  --       },
  --       scope = {
  --         enabled = false, -- Enable scope highlighting
  --       },
  --       exclude = {
  --         filetypes = {
  --           'help',
  --           'lazy',
  --           'neo-tree',
  --           'notify',
  --           'text',
  --           'startify',
  --           'dashboard',
  --           'neogitstatus',
  --           'NvimTree',
  --           'Trouble',
  --         },
  --         buftypes = { 'terminal', 'nofile' }, -- Exclude terminal and nofile buffers
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   'echasnovski/mini.indentscope',
  --   opts = {
  --     draw = {
  --       delay = 100, -- Delay in milliseconds
  --       animation = function()
  --         return 13
  --       end,
  --     },
  --     options = {
  --       try_as_border = true, -- Try drawing as border
  --       indent_at_cursor = false, -- Draw lines at cursor position only
  --       show_when_not_focused = true, -- Show lines when not focused
  --     },
  --     symbol = '│',
  --   },
  -- },
}
