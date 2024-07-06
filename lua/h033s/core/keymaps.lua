vim.g.mapleader = ' '

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Windows Management
vim.keymap.set('n', 'wr', '<C-w>v', { desc = 'Split to the Right' })
vim.keymap.set('n', 'wb', '<C-w>s', { desc = 'Split to the Bottom' })
vim.keymap.set('n', 'wq', ':close<CR>', { desc = 'Close current tab' })
-- Window Movement
vim.keymap.set('n', 'wh', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', 'wl', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', 'wj', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', 'wk', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Tab Management
vim.keymap.set('n', '<leader>wr', '<cmd>tabnew<CR>', { desc = 'Open a new tab' })
vim.keymap.set('n', '<leader>wq', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>wl', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>wh', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })

vim.keymap.set('n', '<S-CR>', 'A<CR><ESC>', { desc = 'Create a new Line' })
vim.keymap.set('n', '<C-CR>', 'i<CR><ESC>', { desc = 'Create a new Line since cursor position' })
