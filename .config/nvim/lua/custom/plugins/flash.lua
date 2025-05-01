return {
  'folke/flash.nvim',
  opts = {

    label = {
      rainbow = {
        enabled = true,
        -- number between 1 and 9
        shade = 1,
      },
    },
    highlight = {
      -- show a backdrop with hl FlashBackdrop
      backdrop = false,
    },
    modes = {
      -- options used when flash is activated through
      -- a regular search with `/` or `?`
      search = {
        -- when `true`, flash will be activated during regular search by default.
        -- You can always toggle when searching with `require("flash").toggle()`
        enabled = true,
      },
      -- options used when flash is activated through
      -- `f`, `F`, `t`, `T`, `;` and `,` motions
      char = {
        highlight = { backdrop = false },
      },
    },
  },
}
