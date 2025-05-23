return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup {
      lightbulb = {
        enable = false,
      },
      implement = {
        enable = false,
      },
      finder = {
        max_height = 0.6,
        keys = {
          vsplit = 'v',
        },
      },
    }
  end,
}
