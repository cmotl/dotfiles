-- Comment.nvim — toggle comments with `gc` (operator/visual) and `gcc` (line).
--  NOTE: Neovim 0.10+ ships a built-in `gc`/`gcc`; this is kept from the previous
--  config and overrides the builtin with the same keymaps. Safe to delete if you
--  prefer the native commenting.
vim.pack.add { 'https://github.com/numToStr/Comment.nvim' }

require('Comment').setup {}
