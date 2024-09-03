require "nvchad.mappings"
require "configs.keymaps"
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Open Oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<space>-", require("oil").toggle_float, { desc = "Open parent directory" })

-- Ufo config
map("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
map("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kind" })
map("n", "zm", require("ufo").closeFoldsWith, { desc = "Close folds with kind" }) -- closeAllFolds == closeFoldsWith(0)

-- Harpoon config
map("n", "hx", require("harpoon.mark").add_file, { desc = "Add harpoon file" })
map("n", "hn", require("harpoon.ui").nav_next, { desc = "Harpoon next buffer" })
map("n", "hp", require("harpoon.ui").nav_prev, { desc = "Harpoon prev buffer" })
map("n", "ho", require("harpoon.ui").toggle_quick_menu, { desc = "Open harpoon quick menu" })
map("n", "hm", ":Telescope harpoon marks<CR>", { desc = "Telescope open harpoon window" })
