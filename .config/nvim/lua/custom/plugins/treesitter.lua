return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
      'json',
      'javascript',
      'typescript',
      'tsx',
      'dockerfile',
      'yaml',
      'html',
      'css',
      'markdown',
      'markdown_inline',
      'bash',
      'lua',
      'vim',
      'vimdoc',
      'vue',
      'query',
      'python',
      'vim',
      'sql',
      'swift',
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',
        node_incremental = '<C-space>',
        scope_incremental = false,
        node_decremental = '<bs>',
      },
    },
  },
}
