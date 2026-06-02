-- Personal keymaps carried over from the previous config.
-- (Lives under custom/plugins/ so the custom loader picks it up automatically.)

-- Quick save with F3 (returns to / stays in normal mode)
vim.keymap.set('n', '<F3>', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('i', '<F3>', '<Esc><cmd>w<CR>', { desc = 'Save file' })

-- Tab navigation
vim.keymap.set('n', '<F9>', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<F10>', '<cmd>tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<F12>', '<cmd>tabnew<CR>', { desc = 'New tab' })
