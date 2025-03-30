-- lsp-config.lua
local icons = require("icons")
vim.diagnostic.config({
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
		style = "minimal",
		border = "rounded",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(_, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({
		buffer = bufnr,
		preserve_mappings = false,
	})

	-- Added custom keybindings for LSP
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
end)

-- https://lsp-zero.netlify.app/docs/language-server-configuration.html#disable-semantic-highlights
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local id = vim.tbl_get(event, "data", "client_id")
		local client = id and vim.lsp.get_client_by_id(id)
		if client == nil then
			return
		end

		-- Disable semantic highlights
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

-- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end,
	},
})

-- Manually set up SourceKit-LSP
require("lspconfig").sourcekit.setup({
	cmd = { "xcrun", "-f", "sourcekit-lsp" },
	filetypes = { "swift" },
	root_dir = require("lspconfig").util.root_pattern("Package.swift", ".git", "compile_commands.json"),
	capabilities = require("cmp_nvim_lsp").default_capabilities(), -- If using nvim-cmp for autocomplete
})
