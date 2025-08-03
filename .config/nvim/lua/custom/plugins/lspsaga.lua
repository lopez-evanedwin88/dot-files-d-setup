function _G.MyWinbar()
  local bar = require('lspsaga.symbol.winbar').get_bar()
  if bar == nil or bar == '' then
    return '  ' .. vim.fn.expand '%:t' -- fallback to file name
  end
  return '  ' .. bar
end

return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup {
      symbol_in_winbar = {
        enable = false,
      },
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
    vim.o.winbar = '%{%v:lua.MyWinbar()%}'
  end,
}
