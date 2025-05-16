local colors = {
  blue = '#80a0ff',
  cyan = '#79dac8',
  black = '#080808',
  white = '#c6c6c6',
  red = '#ff5189',
  violet = '#d183e8',
  grey = '#303030',
}

-- local bubbles_theme = {
--   normal = {
--     a = { fg = colors.black, bg = colors.violet },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.white },
--   },
--
--   insert = { a = { fg = colors.black, bg = colors.blue } },
--   visual = { a = { fg = colors.black, bg = colors.cyan } },
--   replace = { a = { fg = colors.black, bg = colors.red } },
--
--   inactive = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.black },
--     c = { fg = colors.white },
--   },
-- }

local themes = {
  normal = {
    a = { fg = colors.white, bg = nil },
    b = { fg = colors.white, bg = nil },
    c = { fg = colors.white, bg = nil },
  },

  insert = {
    a = { fg = colors.violet, bg = nil },
  },

  visual = {
    a = { fg = colors.cyan, bg = nil },
  },

  replace = {
    a = { fg = colors.blue, bg = nil },
  },

  inactive = {
    a = { fg = colors.white, bg = nil },
    b = { fg = colors.white, bg = nil },
    c = { fg = colors.white, bg = nil },
  },
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  opts = {
    options = {
      theme = 'auto',
    },
  },
  -- opts = {
  --   options = {
  --     icons_enabled = true,
  --     theme = themes,
  --     component_separators = '',
  --     section_separators = { left = '', right = '' },
  --     disabled_filetypes = {
  --       'neo-tree',
  --       statusline = {},
  --       winbar = {},
  --     },
  --     ignore_focus = {},
  --     always_divide_middle = true,
  --     globalstatus = false,
  --     refresh = {
  --       statusline = 1000,
  --       tabline = 1000,
  --       winbar = 1000,
  --     },
  --   },
  --   sections = {
  --     lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
  --     lualine_b = { 'branch', 'diff', 'diagnostics' },
  --     lualine_c = { 'filename' },
  --     lualine_x = { 'encoding', 'fileformat', 'filetype' },
  --     lualine_y = { 'progress' },
  --     lualine_z = { 'location' },
  --   },
  --   inactive_sections = {
  --     lualine_a = {},
  --     lualine_b = {},
  --     lualine_c = { 'filename' },
  --     lualine_x = { 'location' },
  --     lualine_y = {},
  --     lualine_z = {},
  --   },
  --   tabline = {},
  --   winbar = {},
  --   inactive_winbar = {},
  --   extensions = {},
  -- },
}
