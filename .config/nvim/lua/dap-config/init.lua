local dap, dapui = require("dap"), require("dapui")
local dap_utils = require("dap.utils")
require("dapui").setup()

-- Change to local venv project
require("dap-python").setup("/Users/evanlopez/Development/visibility-dashboard/venv/bin/python")

-- vim.keymap.set("n", "<F5>", function()
-- 	require("dap").continue()
-- end, { desc = "Continue" })
-- vim.keymap.set("n", "<F10>", function()
-- 	require("dap").step_over()
-- end, { desc = "Step Over" })
-- vim.keymap.set("n", "<F11>", function()
-- 	require("dap").step_into()
-- end, { desc = "Step Into" })
-- vim.keymap.set("n", "<F12>", function()
-- 	require("dap").step_out()
-- end, { desc = "Step Out" })
-- vim.keymap.set("n", "<Leader>b", function()
-- 	require("dap").toggle_breakpoint()
-- end, { desc = "Toggle Breakpoint" })
-- vim.keymap.set("n", "<Leader>B", function()
-- 	require("dap").set_breakpoint()
-- end, { desc = "Set Breakpoint" })
-- vim.keymap.set("n", "<Leader>lp", function()
-- 	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
-- end, { desc = "Breakpoint condition:" })
-- vim.keymap.set("n", "<Leader>dr", function()
-- 	require("dap").repl.open()
-- end, { desc = "Toggle repl" })
-- vim.keymap.set("n", "<Leader>dl", function()
-- 	require("dap").run_last()
-- end, { desc = "Run Last" })
-- vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
-- 	require("dap.ui.widgets").hover()
-- end, { desc = "Dap UI hover" })
-- vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
-- 	require("dap.ui.widgets").preview()
-- end, { desc = "Dap UI Preview" })
-- vim.keymap.set("n", "<Leader>df", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	widgets.centered_float(widgets.frames)
-- end, { desc = "Dap UI centered float frames" })
-- vim.keymap.set("n", "<Leader>ds", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	widgets.centered_float(widgets.scopes)
-- end, { desc = "Dap UI centered float scopes" })
--
-- vim.keymap.set("n", "<Leader>du", function()
-- 	require("dapui").toggle({})
-- end, { desc = "Dap UI" })
-- vim.keymap.set({ "n", "v" }, "<Leader>de", function()
-- 	require("dapui").eval()
-- end, { desc = "Eval" })


vim.fn.sign_define("DapBreakpoint", { text = "⬤", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define('DapStopped', { text='⏭', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

require("nvim-dap-virtual-text").setup()

require("mason-nvim-dap").setup({
	automatic_installation = false,
	ensure_installed = {
		-- Due to a bug with the latest version of vscode-js-debug, need to lock to specific version
		-- See: https://github.com/mxsdev/nvim-dap-vscode-js/issues/58#issuecomment-2213230558
		"js@v1.76.1",
		"chrome",
	},
})

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}", --let both ports be the same for now...
	executable = {
		command = "node",
		-- -- 💀 Make sure to update this path to point to your installation
		args = {
			vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/out/src/debugServer.js",
			"${port}",
		},
		-- command = "js-debug-adapter",
		-- args = { "${port}" },
	},
}

dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { vim.fn.stdpath("data") .. "/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" }, -- TODO adjust
}

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = {
		"/Users/evanlopez/Development/visibility-dashboard/frontend/node_modules/react-scripts/bin/react-scripts.js",
	},
}

for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }) do
	dap.configurations[language] = {
		-- Debug single nodejs files
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
		},
		-- Debug nodejs processes (make sure to add --inspect when you run the process)
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
		},
		-- Debug web applications (client side)
		{
			type = "pwa-chrome",
			request = "launch",
			name = "Launch & Debug Chrome",
			url = function()
				local co = coroutine.running()
				return coroutine.create(function()
					vim.ui.input({
						prompt = "Enter URL: ",
						default = "http://127.0.0.1:9222",
					}, function(url)
						if url == nil or url == "" then
							return
						else
							coroutine.resume(co, url)
						end
					end)
				end)
			end,
			webRoot = vim.fn.getcwd(),
			protocol = "inspector",
			sourceMaps = true,
			userDataDir = false,
		},
		{
			name = "Debug with node2",
			type = "node2",
			request = "launch",
			program = "/Users/evanlopez/Development/visibility-dashboard/frontend/node_modules/react-scripts/bin/react-scripts.js",
			args = { "start" },
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
		},
		-- Divider for the launch.json derived configs
		-- Divider for the launch.json derived configs
		{
			name = "----- ↓ launch.json configs ↓ -----",
			type = "",
			request = "launch",
		},
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "Launch file",
		-- 	program = "${file}",
		-- 	cwd = "${workspaceFolder}",
		-- },
		-- {
		-- 	type = "chrome",
		-- 	request = "attach",
		-- 	program = "${file}",
		-- 	cwd = vim.fn.getcwd(),
		-- 	sourceMaps = true,
		-- 	protocol = "inspector",
		-- 	port = 9222,
		-- 	webRoot = "${workspaceFolder}",
		-- },
		-- {
		-- 	type = "pwa-chrome",
		-- 	request = "launch",
		-- 	name = 'Launch Chrome with "localhost"',
		-- 	url = function()
		-- 		local co = coroutine.running()
		-- 		return coroutine.create(function()
		-- 			vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:3000" }, function(url)
		-- 				if url == nil or url == "" then
		-- 					return
		-- 				else
		-- 					coroutine.resume(co, url)
		-- 				end
		-- 			end)
		-- 		end)
		-- 	end,
		-- 	webRoot = vim.fn.getcwd(),
		-- 	protocol = "inspector",
		-- 	sourceMaps = true,
		-- 	userDataDir = false,
		-- 	resolveSourceMapLocations = {
		-- 		"${workspaceFolder}/**",
		-- 		"!**/node_modules/**",
		-- 	},
		-- },
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "Launch Current File (pwa-node)",
		-- 	cwd = vim.fn.getcwd(),
		-- 	args = { "${file}" },
		-- 	sourceMaps = true,
		-- 	protocol = "inspector",
		-- 	runtimeExecutable = "npm",
		-- 	runtimeArgs = {
		-- 		"run-script",
		-- 		"dev",
		-- 	},
		-- 	resolveSourceMapLocations = {
		-- 		"${workspaceFolder}/**",
		-- 		"!**/node_modules/**",
		-- 	},
		-- },
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "Launch Current File (pwa-node with ts-node)",
		-- 	cwd = vim.fn.getcwd(),
		-- 	runtimeArgs = { "--loader", "ts-node/esm" },
		-- 	runtimeExecutable = "node",
		-- 	args = { "${file}" },
		-- 	sourceMaps = true,
		-- 	protocol = "inspector",
		-- 	skipFiles = { "<node_internals>/**", "node_modules/**" },
		-- 	resolveSourceMapLocations = {
		-- 		"${workspaceFolder}/**",
		-- 		"!**/node_modules/**",
		-- 	},
		-- },
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "Launch Current File (pwa-node with deno)",
		-- 	cwd = vim.fn.getcwd(),
		-- 	runtimeArgs = { "run", "--inspect-brk", "--allow-all", "${file}" },
		-- 	runtimeExecutable = "deno",
		-- 	attachSimplePort = 9229,
		-- },
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "Launch Test Current File (pwa-node with jest)",
		-- 	cwd = vim.fn.getcwd(),
		-- 	runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
		-- 	runtimeExecutable = "node",
		-- 	args = { "${file}", "--coverage", "false" },
		-- 	rootPath = "${workspaceFolder}",
		-- 	sourceMaps = true,
		-- 	console = "integratedTerminal",
		-- 	internalConsoleOptions = "neverOpen",
		-- 	skipFiles = { "<node_internals>/**", "node_modules/**" },
		-- },
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "Launch Test Current File (pwa-node with vitest)",
		-- 	cwd = vim.fn.getcwd(),
		-- 	program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
		-- 	args = { "--inspect-brk", "--threads", "false", "run", "${file}" },
		-- 	autoAttachChildProcesses = true,
		-- 	smartStep = true,
		-- 	console = "integratedTerminal",
		-- 	skipFiles = { "<node_internals>/**", "node_modules/**" },
		-- },
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "Launch Test Current File (pwa-node with deno)",
		-- 	cwd = vim.fn.getcwd(),
		-- 	runtimeArgs = { "test", "--inspect-brk", "--allow-all", "${file}" },
		-- 	runtimeExecutable = "deno",
		-- 	attachSimplePort = 9229,
		-- },
		-- {
		-- 	type = "pwa-chrome",
		-- 	request = "attach",
		-- 	name = "Attach Program (pwa-chrome, select port)",
		-- 	program = "${file}",
		-- 	cwd = vim.fn.getcwd(),
		-- 	sourceMaps = true,
		-- 	protocol = "inspector",
		-- 	port = function()
		-- 		return vim.fn.input("Select port: ", 9222)
		-- 	end,
		-- 	webRoot = "${workspaceFolder}",
		-- },
		-- {
		-- 	type = "pwa-node",
		-- 	request = "attach",
		-- 	name = "Attach Program (pwa-node, select pid)",
		-- 	cwd = vim.fn.getcwd(),
		-- 	processId = dap_utils.pick_process,
		-- 	skipFiles = { "<node_internals>/**" },
		-- },
	}
end
