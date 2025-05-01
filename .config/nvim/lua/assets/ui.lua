local M = {}

function M.ColorMyWorkspace(color)
  color = color or 'kanagawa'
  vim.cmd('colorscheme ' .. color)
  vim.cmd 'highlight TelescopeBorder guibg=none'
  vim.cmd 'highlight TelescopeTitle guibg=none'
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return M
