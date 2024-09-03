require("telescope").setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
})

require("telescope").load_extension("luasnip")
require("telescope").load_extension("noice")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("harpoon")
