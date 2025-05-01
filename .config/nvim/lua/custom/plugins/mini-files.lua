return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  {
    'mini.files',
    keys = {
      {
        '<leader>-',
        function()
          require('mini.files').open(vim.uv.cwd(), true)
        end,
        desc = 'Open Mini Files',
      },
      {
        '-',
        function()
          local buf_path = vim.api.nvim_buf_get_name(0)
          require('mini.files').open(buf_path ~= '' and vim.fn.fnamemodify(buf_path, ':p:h') or vim.uv.cwd(), true)
        end,
        desc = 'Open Mini Files at Current File',
      },
    },
    opts = {
      mappings = {
        close = 'q',
        go_in = 'l',
        go_in_plus = '<CR>',
        go_out = 'h',
        go_out_plus = '<BS>',
        reset = '<C-r>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = 's',
        trim_left = '<',
        trim_right = '>',
      },
      options = {
        permanent_delete = false,
        use_as_default_explorer = true,
      },
      windows = {
        preview = true,
        width_focus = 30,
        width_nofocus = 15,
        width_preview = 50,
      },
    },
  },
}
