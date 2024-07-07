return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require('lint')
        lint.linters_by_ft = {
            python = { "pylint" },
            html = { "eslint_d" },
            css = { "eslint_d" },
            javascript = { "eslint_d" },
            typescript = { "eslint_d" }
        }
    end,
}
