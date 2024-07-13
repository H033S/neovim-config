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
-- Line Management
vim.keymap.set('n', '<S-CR>', 'A<CR><ESC>', { desc = 'Create a new Line' })
vim.keymap.set('n', '<C-CR>', 'i<CR><ESC>', { desc = 'Create a new Line since cursor position' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Line one line to bottom' })
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", { desc = 'Move Line one line to top' })

vim.keymap.set('n', 'n', 'nzzzv', {desc = "Next Ocurrence in Middle Screen"})
vim.keymap.set('n', 'n', 'nzzzv', {desc = "Next Ocurrence in Middle Screen"})
vim.keymap.set('n', '<C-d>', '<C-d>zz', {desc = "Scroll Down Keeping Cursor in the Middle"})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {desc = "Scroll Up Keeping Cursor in the Middle"})

-- Yanks
vim.keymap.set({'v', 'n'}, 'Y', 'y$')
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>Y", [["+Y]])
-- Teminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {desc = "Close Terminal"})
vim.keymap.set("n", "<leader>t", "<cmd>bel term<CR>")
vim.keymap.set("n", "<leader>tw", function()
    local bufferFilePath = vim.fn.expand("%")
    local bufferDirectory = vim.fn.fnamemodify(bufferFilePath, ":p:h")
    vim.cmd(string.format(":botright new | call termopen(&shell, #{cwd: '%s'})", bufferDirectory))
end)

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local opts = {buffer = ev.bufnr, remap = false}
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})
