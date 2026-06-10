return {
  -- Themes
  -- {
  --   'rebelot/kanagawa.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('kanagawa').setup {
  --       transparent = true,
  --       colors = {
  --         theme = {
  --           wave = {
  --             ui = {
  --               bg_gutter = 'none',
  --               bg_m3 = 'none',
  --               bg_p1 = 'none',
  --               float = {
  --                 bg = 'none',
  --               },
  --             },
  --           },
  --           all = {
  --             ui = {
  --               bg_gutter = 'none',
  --             },
  --           },
  --         },
  --       },
  --     }
  --     require('assets.ui').ColorMyWorkspace 'kanagawa'
  --   end,
  -- },
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
  --     require('vague').setup {
  --       transparent = true,
  --     }
  --     require('assets.ui').ColorMyWorkspace 'vague'
  --   end,
  -- },
  -- {
  --   'panjakub/cobaltnext.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('assets.ui').ColorMyWorkspace 'cobaltnext_dark'
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
  --     require('assets.ui').ColorMyWorkspace 'onedark'
  --
  --     vim.cmd(":hi statusline guibg=NONE")
  --     vim.cmd(":hi WinBar guibg=NONE")
  --
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
  --     Group.new('Visual', colors.none, colors.base1, styles.reverse)
  --   end,
  -- },
  -- {
  --   'projekt0n/github-nvim-theme',
  --   name = 'github-theme',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('github-theme').setup { options = {
  --       transparent = true,
  --     } }
  --
  --     require('assets.ui').ColorMyWorkspace 'github_dark_dimmed'
  --   end,
  -- },
  -- {
  --   'Mofiqul/vscode.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('vscode').setup {
  --       transparent = false,
  --     }
  --     -- require('assets.ui').ColorMyWorkspace 'vscode'
  --     require('core.ui').ColorMyWorkspace 'torte'
  --   end,
  -- },
  -- {
  --   'danhat1020/silence.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('silence').setup {
  --       transparent = false,
  --       bold = true,
  --     }
  --     require('core.ui').ColorMyWorkspace 'silence'
  --   end,
  -- },
  -- {
  --   "santhosh-tekuri/silence.nvim",
  --   priority = 1000,
  --   config = function()
  --     require('core.ui').ColorMyWorkspace 'silence'
  --   end,
  -- },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        variant = 'main', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = false,
          transparency = false,
        },

        groups = {
          border = 'muted',
          link = 'iris',
          panel = 'surface',

          error = 'love',
          hint = 'iris',
          info = 'foam',
          note = 'pine',
          todo = 'rose',
          warn = 'gold',

          git_add = 'foam',
          git_change = 'rose',
          git_delete = 'love',
          git_dirty = 'rose',
          git_ignore = 'muted',
          git_merge = 'iris',
          git_rename = 'pine',
          git_stage = 'iris',
          git_text = 'rose',
          git_untracked = 'subtle',

          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },
      }
      require('core.ui').ColorMyWorkspace 'rose-pine'
    end,
  },
}
