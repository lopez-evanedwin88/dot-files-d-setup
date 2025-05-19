return {
  -- Themes
  -- {
  -- 	"rebelot/kanagawa.nvim",
  -- 	config = function()
  -- 		require("core.ui").ColorMyWorkspace("kanagawa")
  -- 	end,
  -- },
  -- { "shaunsingh/nord.nvim" },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        transparent = true,
        -- styles = {
        --   sidebars = 'transparent',
        --   floats = 'transparent',
        -- },
      }
      require('core.ui').ColorMyWorkspace 'tokyonight-moon'
    end,
  },
  -- { "vague2k/vague.nvim" },
  -- {
  -- 	"catppuccin/nvim",
  -- 	name = "catppuccin",
  -- 	priority = 1000,
  -- 	config = function()
  -- 		require("catppuccin").setup({
  -- 			transparent_background = true, -- Key for transparency
  -- 			term_colors = true,
  -- 		})
  -- 		require("core.ui").ColorMyWorkspace("catppuccin-mocha")
  -- 	end,
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
  {
    'tjdevries/colorbuddy.nvim',
    config = function()
      local colorbuddy = require 'colorbuddy'
      local Color = colorbuddy.Color
      local Group = colorbuddy.Group
      local colors = colorbuddy.colors
      local styles = colorbuddy.styles

      Color.new('black', '#000000')
      Color.new('highlight_bg', '#3f3f3f') -- Background color

      Group.new('CursorLine', colors.none, colors.base03, styles.none, colors.base1)
      Group.new('CursorLineNr', colors.yellow, colors.black, styles.none, colors.base1)
      Group.new('Visual', colors.none, colors.base1, styles.reverse)
      Group.new('IlluminatedWordText', colors.none, colors.highlight_bg)
      Group.new('IlluminatedWordRead', colors.none, colors.highlight_bg)
      Group.new('IlluminatedWordWrite', colors.none, colors.highlight_bg)
    end,
  },
}
