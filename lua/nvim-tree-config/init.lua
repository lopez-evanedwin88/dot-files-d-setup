--require('nvim-tree').setup({
--  disable_netrw = true,
--  hijack_netrw = true,
--  ignore_ft_on_setup = {'dashboard'},
--  open_on_tab = false,
--    hijack_cursor = true,
--    update_cwd = true,
--    update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
--    system_open = {
--        -- the command to run this, leaving nil should work in most cases
--        cmd = nil,
--        -- the command arguments as a list
--        args = {}
--    },
--  view = {
--    width = 25,
--    side = 'left',
--    mappings = { custom_only = false, list = {}}
--  },
--  git = {
--    ignore = true
--  },
--  renderer = {
--    indent_markers = {
--      enable = true
--    }
--  }
--})



require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "all",
    highlight_modified = "none",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    -- These icons are visible when you install web-devicons
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
  },
})
