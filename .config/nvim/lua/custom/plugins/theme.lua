return {
  -- Themes
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        transparent = true,
        colors = {
          theme = {
            wave = {
              ui = {
                bg_gutter = 'none',
                bg_m3 = 'none',
                bg_p1 = 'none',
                float = {
                  bg = 'none',
                },
              },
            },
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
      }
      require('core.ui').ColorMyWorkspace 'kanagawa'
    end,
  },
  -- { "shaunsingh/nord.nvim" },
  -- {
  --   'folke/tokyonight.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('tokyonight').setup {
  --       transparent = true,
  --       styles = {
  --         sidebars = 'transparent',
  --         floats = 'transparent',
  --       },
  --     }
  --     require('core.ui').ColorMyWorkspace 'tokyonight'
  --   end,
  -- },
  -- {
  --   'vague2k/vague.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('vague').setup()
  --     require('core.ui').ColorMyWorkspace 'vague'
  --   end,
  -- },
  -- {
  --   'catppuccin/nvim',
  --   priority = 1000,
  --   config = function()
  --     require('catppuccin').setup {
  --       flavour = 'auto', -- latte, frappe, macchiato, mocha
  --       background = { -- :h background
  --         light = 'latte',
  --         dark = 'mocha',
  --       },
  --       transparent_background = true, -- Key for transparency
  --     }
  --     require('core.ui').ColorMyWorkspace 'catppuccin-mocha'
  --   end,
  -- },
  -- { "embark-theme/vim" },
  -- { 'AbdelrahmanDwedar/awesome-nvim-colorschemes' },
  -- {
  --   'scottmckendry/cyberdream.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('cyberdream').setup {
  --       transparent = true,
  --     }
  --     require('core.ui').ColorMyWorkspace 'cyberdream'
  --   end,
  -- },
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('gruvbox').setup {
  --       transparent_mode = true,
  --       terminal_colors = false,
  --     }
  --     require('core.ui').ColorMyWorkspace 'gruvbox'
  --   end,
  -- },
  -- {
  --   'navarasu/onedark.nvim',
  --   priority = 1000, -- Ensure it loads first
  --   config = function()
  --     require('onedark').setup {
  --       style = 'darker',
  --       term_colors = true,
  --       transparency = true,
  --     }
  --
  --     require('core.ui').ColorMyWorkspace 'onedark'
  --   end,
  -- },
  -- {
  --   'tjdevries/colorbuddy.nvim',
  --   config = function()
  --     local colorbuddy = require 'colorbuddy'
  --     local Color = colorbuddy.Color
  --     local Group = colorbuddy.Group
  --     local colors = colorbuddy.colors
  --     local styles = colorbuddy.styles
  --
  --     Color.new('black', '#000000')
  --     Color.new('highlight_bg', '#3f3f3f') -- Background color
  --
  --     Group.new('CursorLine', colors.none, colors.base03, styles.none, colors.base1)
  --     Group.new('CursorLineNr', colors.yellow, colors.black, styles.none, colors.base1)
  --     -- Group.new('Visual', colors.none, colors.base1, styles.reverse)
  --   end,
  -- },
}
