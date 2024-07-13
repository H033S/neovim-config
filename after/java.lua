vim.keymap('n','<A-o>', "<Cmd>lua require'jdtls'.organize_imports()<CR>", {desc = "Organize Imports"})
vim.keymap({'n', 'v'},'crv', "<Cmd>lua require('jdtls').extract_variable()<CR>", {desc = "Extract variable"})
vim.keymap({"n", "v"},"crc","<Cmd>lua require('jdtls').extract_constant()<CR>", {desc = "Extract Constant"})
vim.keymap({"n","v"},"crm","<Esc><Cmd>lua require('jdtls').extract_method()<CR>", {desc = "Extract Method"})
vim.keymap("n", "<leader>rtc", "<Cmd>lua require'jdtls'.test_class()<CR>", {desc = "Test Class"})
vim.keymap("n", "<leader>rt", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", {desc = "Test Nearest Method"})

