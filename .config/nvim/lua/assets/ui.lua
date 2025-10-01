local M = {}

function M.ColorMyWorkspace(color)
  color = color or 'kanagawa'
  vim.cmd('colorscheme ' .. color)
  vim.cmd 'highlight TelescopeBorder guibg=none'
  vim.cmd 'highlight TelescopeTitle guibg=none'
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = 'none' })
end

return M
