local black = '#45475a'
local gray = '#585b70'
local red = '#f38ba8'
local green = '#a6e3a1'
local yellow = '#f9e2af'
local blue = '#89b4fa'
local magenta = '#f5c2e7'
local cyan = '#94e2d5'
local white = '#bac2de'
local fg = '#cdd6f4'
local bg = '#1e1e2e'
local links = '#89dceb'

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      mode = 'buffers', -- set to "tabs" to only show tabpages instead
      themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
      numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
      right_mouse_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
      left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
      -- buffer_close_icon = '󰅖',
      buffer_close_icon = '✗',
      -- buffer_close_icon = '✕',
      close_icon = '',
      path_components = 1, -- Show only the file name without the directory
      modified_icon = '●',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      tab_size = 21,
      diagnostics = true,
      diagnostics_update_in_insert = true,
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      separator_style = { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      show_tab_indicators = false,
      indicator = {
        -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'none', -- Options: 'icon', 'underline', 'none'
      },
      icon_pinned = '󰐃',
      minimum_padding = 1,
      maximum_padding = 5,
      maximum_length = 15,
      sort_by = 'insert_at_end',
    },
    highlights = {
      -- buffer_selected = {
      -- 	bold = true,
      -- 	italic = false,
      -- },
      -- separator_selected = {},
      -- tab_selected = {},
      -- background = {
      -- bg = "#1e1e2e",
      -- fg = gray,
      -- },
      separator = {
        fg = '#434C5E',
        bg = 'NONE',
      },
      separator_selected = { bg = 'NONE' },
      separator_visible = { bg = 'NONE' },
      background = { bg = 'NONE' }, -- Make background transparent
      buffer_selected = { bg = 'NONE' },
      buffer_visible = { bg = 'NONE' },
      -- indicator_selected = {},
      -- fill = {},
    },
  },
}
