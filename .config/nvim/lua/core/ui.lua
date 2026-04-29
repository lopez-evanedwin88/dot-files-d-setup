local M = {}

function M.ColorMyWorkspace(color)
  color = color or 'kanagawa'
  vim.cmd('colorscheme ' .. color)
  vim.cmd 'highlight TelescopeBorder guibg=none'
  vim.cmd 'highlight TelescopeTitle guibg=none'
  vim.cmd ':hi statusline guibg=NONE guifg=#adbac7'
  vim.cmd ':hi WinBar guibg=NONE'
  local normal_hl = vim.api.nvim_get_hl(0, { name = 'Normal' })
  normal_hl.bg = nil
  vim.api.nvim_set_hl(0, 'Normal', normal_hl)
  local float_hl = vim.api.nvim_get_hl(0, { name = 'NormalFloat' })
  float_hl.bg = nil
  vim.api.nvim_set_hl(0, 'NormalFloat', float_hl)
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#5d4d7a', bg = 'none' })
end

return M
