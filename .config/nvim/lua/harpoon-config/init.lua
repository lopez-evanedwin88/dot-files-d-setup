require("harpoon").setup({})

vim.keymap.set("n", "hx", require("harpoon.mark").add_file, { desc = "Add harpoon file" })
vim.keymap.set("n", "hn", require("harpoon.ui").nav_next, { desc = "Harpoon next buffer" })
vim.keymap.set("n", "hp", require("harpoon.ui").nav_prev, { desc = "Harpoon prev buffer" })
vim.keymap.set("n", "ho", require("harpoon.ui").toggle_quick_menu, { desc = "Open harpoon quick menu" })
vim.keymap.set("n", "hm", ":Telescope harpoon marks<CR>", { desc = "Telescope open harpoon window" })
