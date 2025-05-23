return {
  'kevinhwang91/nvim-hlslens',
  config = function()
    require('hlslens').setup {
      nearest_only = true,
      calm_down = true,
      override_lens = function(render, plist, nearest, idx)
        local unpack = unpack or table.unpack
        local lnum, col = unpack(plist[idx])
        local text
        if nearest then
          text = string.format('[%d/%d]', idx, #plist)
        else
          text = string.format('  %d/%d', idx, #plist)
        end
        local chunks = { { text, 'Comment' } }
        render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
      end,
    }

    local kopts = { noremap = true, silent = true }
    local lens = require 'hlslens'
    local keymap = vim.keymap.set

    keymap('n', 'n', function()
      vim.cmd('normal! ' .. vim.v.count1 .. 'n')
      lens.start()
    end, kopts)

    keymap('n', 'N', function()
      vim.cmd('normal! ' .. vim.v.count1 .. 'N')
      lens.start()
    end, kopts)

    keymap('n', '*', function()
      vim.cmd 'normal! *'
      lens.start()
    end, kopts)

    keymap('n', '#', function()
      vim.cmd 'normal! #'
      lens.start()
    end, kopts)

    keymap('n', 'g*', function()
      vim.cmd 'normal! g*'
      lens.start()
    end, kopts)

    keymap('n', 'g#', function()
      vim.cmd 'normal! g#'
      lens.start()
    end, kopts)
  end,
}
