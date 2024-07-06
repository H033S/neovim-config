return {
    "nvimtools/none-ls.nvim",

    keys = {
        { "<leader>gf", vim.lsp.buf.format, mode = "n", { desc = "Format Buffer" } },
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylelua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,

                null_ls.builtins.diagnostics.eslint_d,
            }
        })
    end
}
