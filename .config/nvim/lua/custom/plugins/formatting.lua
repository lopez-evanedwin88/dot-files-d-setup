function _AFTER_FORMATTING(err, did_edit)
  if err then
    vim.notify('Format failed: ' .. err, vim.log.levels.ERROR)
  elseif not did_edit then
    vim.notify('No formatting changes made', vim.log.levels.INFO)
  else
    vim.notify('Buffer formatted successfully', vim.log.levels.INFO)
  end
end

return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require('conform').setup {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        swift = { 'swiftformat', 'swiftlint' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
      },
      formatters = {
        swiftlint = {
          command = vim.fn.stdpath 'data' .. '/mason/bin/swiftlint',
          args = { 'autocorrect', '--quiet', vim.api.nvim_buf_get_name(0) },
          stdin = false,
          cwd = require('conform.util').root_file { '.swiftlint.yml', 'Package.swift', '.git' },
        },
      },
    }
  end,
}
