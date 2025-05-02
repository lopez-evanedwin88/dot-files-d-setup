-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'andymass/vim-matchup',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = nil }
      vim.g.matchup_matchpref = { html = { nolists = 1 } }
    end,
  },
  {
    'mg979/vim-visual-multi',
  },
  {
    'mistweaverco/kulala.nvim',
    ft = { 'http', 'rest' },
    opts = {
      -- your configuration comes here
      global_keymaps = true,
    },
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup { '*' }
    end,
  },
}
