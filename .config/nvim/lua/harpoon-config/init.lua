local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end


vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon file" })
--vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon buffer 1" })
--vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Harpoon buffer 2" })
--vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Harpoon buffer 3" })
--vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Harpoon buffer 4" })


-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon prev buffer" })
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon next buffer" })

vim.keymap.set("n", "<leader>ho", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
