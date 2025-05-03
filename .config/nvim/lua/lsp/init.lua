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

local buffer_autoformat = function(bufnr)
	local group = "lsp_autoformat"
	vim.api.nvim_create_augroup(group, { clear = false })
	vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = bufnr,
		group = group,
		desc = "LSP format on save",
		callback = function()
			-- note: do not enable async formatting
			vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
		end,
	})
end

-- https://lsp-zero.netlify.app/docs/language-server-configuration.html#disable-semantic-highlights
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "grd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "grD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "gro", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "grs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		-- vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		local id = vim.tbl_get(event, "data", "client_id")
		local client = id and vim.lsp.get_client_by_id(id)
		if client == nil then
			return
		end

		-- make sure there is at least one client with formatting capabilities
		if client.supports_method("textDocument/formatting") then
			buffer_autoformat(event.buf)
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
