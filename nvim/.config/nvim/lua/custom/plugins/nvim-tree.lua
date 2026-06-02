-- nvim-tree — file explorer that replaces netrw (disabled in init.lua).
vim.pack.add {
  'https://github.com/nvim-tree/nvim-tree.lua',
  'https://github.com/nvim-tree/nvim-web-devicons', -- icons (Nerd Font)
}

require('nvim-tree').setup {
  sort = { sorter = 'case_sensitive' },
  view = { width = 30 },
  renderer = { group_empty = true },
  filters = { dotfiles = true },
}

-- Toggle the explorer
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file [E]xplorer' })
