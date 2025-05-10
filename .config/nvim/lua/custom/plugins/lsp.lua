-- lsp-config.lua

local icons = require 'assets.icons'

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
    },
  },
  virtual_text = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    header = '',
    prefix = '',
  },
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then
      return
    end

    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'grd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gro', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'grs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

    -- if client.supports_method("textDocument/formatting") then
    -- 	buffer_autoformat(event.buf)
    -- end

    -- Disable semantic tokens
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

return {
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'whoissethdaniel/mason-tool-installer.nvim',
      { 'antosha417/nvim-lsp-file-operations', config = true },
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      -- local buffer_autoformat = function(bufnr)
      -- 	local group = "lsp_autoformat"
      -- 	vim.api.nvim_create_augroup(group, { clear = false })
      -- 	vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
      --
      -- 	vim.api.nvim_create_autocmd("BufWritePre", {
      -- 		buffer = bufnr,
      -- 		group = group,
      -- 		desc = "LSP format on save",
      -- 		callback = function()
      -- 			vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
      -- 		end,
      -- 	})
      -- end
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = capabilities
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }

      -- Manually configure sourcekit-lsp (not managed by mason)
      require('lspconfig').sourcekit.setup {
        cmd = { vim.trim(vim.fn.system 'xcrun -f sourcekit-lsp') },
        filetypes = { 'swift' },
        root_dir = require('lspconfig').util.root_pattern('Package.swift', '.git', 'compile_commands.json'),
        capabilities = capabilities,
        on_init = function(client)
          -- HACK: to fix some issues with LSP
          -- more details: https://github.com/neovim/neovim/issues/19237#issuecomment-2237037154
          client.offset_encoding = 'utf-8'
        end,
      }
    end,
  },
}
