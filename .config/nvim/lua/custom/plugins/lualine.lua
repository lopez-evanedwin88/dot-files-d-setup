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

-- -- Function to get the current mode indicator as a single character
local function mode()
  -- Map of modes to their respective shorthand indicators
  local mode_map = {
    n = 'N', -- Normal mode
    i = 'I', -- Insert mode
    v = 'V', -- Visual mode
    [''] = 'V', -- Visual block mode
    V = 'V', -- Visual line mode
    c = 'C', -- Command-line mode
    no = 'N', -- NInsert mode
    s = 'S', -- Select mode
    S = 'S', -- Select line mode
    ic = 'I', -- Insert mode (completion)
    R = 'R', -- Replace mode
    Rv = 'R', -- Virtual Replace mode
    cv = 'C', -- Command-line mode
    ce = 'C', -- Ex mode
    r = 'R', -- Prompt mode
    rm = 'M', -- More mode
    ['r?'] = '?', -- Confirm mode
    ['!'] = '!', -- Shell mode
    t = 'T', -- Terminal mode
  }
  -- Return the mode shorthand or [UNKNOWN] if no match
  return mode_map[vim.fn.mode()] or '[UNKNOWN]'
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    local kanagawa_colors = require('kanagawa.colors').setup({ theme = 'wave' }).palette
    require('lualine').setup {
      options = {
        theme = {
          normal = {
            a = { fg = kanagawa_colors.crystalBlue, gui = 'bold' },
            b = { fg = kanagawa_colors.crystalBlue },
            c = { fg = kanagawa_colors.fujiWhite, bg = 'none' },
          },
          insert = {
            a = { fg = kanagawa_colors.springGreen, gui = 'bold' },
          },
          visual = {
            a = { fg = kanagawa_colors.oniViolet, gui = 'bold' },
          },
          replace = {
            a = { fg = kanagawa_colors.samuraiRed, gui = 'bold' },
          },
          command = {
            a = { fg = kanagawa_colors.boatYellow2, gui = 'bold' },
          },
          inactive = {
            a = { fg = kanagawa_colors.fujiGray, bg = 'none' },
            b = { fg = kanagawa_colors.fujiGray, bg = 'none' },
            c = { fg = kanagawa_colors.fujiGray, bg = 'none' },
          },
        },
      },
      sections = {
        lualine_a = { { mode, color = { bg = 'nil' } } },
        lualine_b = {
          { 'branch', color = { bg = 'nil' } },
          { 'diff', color = { bg = 'nil' } },
          { 'diagnostics', color = { bg = 'nil' } },
        },
        lualine_c = { { 'filename', color = { bg = 'nil' } } },
        lualine_x = {
          { 'encoding', color = { bg = 'nil' } },
          { 'fileformat', color = { bg = 'nil' } },
          { 'filetype', color = { bg = 'nil' } },
        },
        lualine_y = {
          { 'progress', color = { bg = 'nil' } },
        },
        lualine_z = {
          { 'location', color = { bg = 'nil' } },
        },
      },
    }
  end,
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
