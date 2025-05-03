-- Neovim needs to know which Python to use. If your virtualenv is at ~/myproject/venv/bin/python.
vim.g.python3_host_prog = "~/Development/suggestify-v2/issue-manager/venv/bin/python"
-- Run Python via Docker
-- Tell Neovim to use the container’s Python by invoking it through docker exec:
-- Find Your Container: Run docker ps to get the container name or ID (e.g., my_django_container).
-- Set Python Host: In your init.lua:
-- vim.g.python3_host_prog = 'docker exec -i my_django_container python3'

require("plugins")
require("autocmd-config")
require("lualine-config")
require("options")
require("treesitter-config")
require("nvim-web-devicons")
require("keymaps")
require("telescope-config") -- https://github.com/nvim-telescope/telescope.nvim
require("whichkey")
require("lsp")
-- require("undo-tree-config")
require("gitsigns-config")
require("toggle-term-config")
require("theme-config")
require("lspsaga-config")
require("harpoon-config")
require("none-ls-config")
require("colors")
-- require("noice-config")
-- require('neotree-config')
require("comment-config")
require("nvim-surround-config")
require("lab-config")
require("illuminate-config")
-- require("dashboard-config")
require("ufo-config")
-- require("oil-config")
require("flash-config")
require("dap-config")
require("icons")
require("indentline-config")
require("autopair-config")
require("cmp-config")
-- require("copilot-config")
-- require("eyeliner-config")
-- require("neoscroll-config")
require("numb-config")
-- require("tabby-config")
require("neo-tab-config")
-- require("fzf-config")
require("highlight-config") -- disable temporarily due to sourcekit-lsp crashes
require("colorbuddy-config")
require("bufferline-config") -- Set to last for transparent effect
require("render-markdown-config")
require("you-are-an-idiot-config")
require("smear-cursor-config")
require("xcodebuild-config")
require("fidget-config")
require("snacks-config")
require("mini-files-config")
