-- yeet.nvim — fling shell commands at a terminal / tmux pane.
vim.pack.add {
  'https://github.com/samharju/yeet.nvim',
  'https://github.com/stevearc/dressing.nvim', -- optional: nicer target-selection UI
}

require('yeet').setup {}

local yeet = require 'yeet'
vim.keymap.set('n', '<leader>yt', function() yeet.select_target() end, { desc = '[Y]eet: select [T]arget' })
vim.keymap.set('n', '<leader>yc', function() yeet.set_cmd() end, { desc = '[Y]eet: set [C]ommand' })
vim.keymap.set('n', '\\\\', function() yeet.execute() end, { desc = '[Y]eet: execute command' })
vim.keymap.set('n', '<leader>yo', function() yeet.toggle_post_write() end, { desc = '[Y]eet: toggle post-write yeet' })
vim.keymap.set('n', '<leader>\\', function() yeet.execute(nil, { clear_before_yeet = false }) end, { desc = '[Y]eet: execute (no clear)' })
