return {
    {
        "williamboman/mason.nvim",
        config = function()
            local mason = require('mason')
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        'williamboman/mason-lspconfig',
        config = function()
            local mason_lsp = require('mason-lspconfig')
            mason_lsp.setup({
                ensure_installed = {
                    'lua_ls',
                    'jdtls',
                    'tsserver',
                    'angularls',
                    'pyright',
                }
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'mfussenegger/nvim-lint',
        },
        keys = {
            { "K",          vim.lsp.buf.hover,                         mode = "n",          { desc = "Show documentation for what is under cursor" } },
            { "<leader>ca", vim.lsp.buf.code_action,                   mode = { "n", "v" }, { desc = "See available code actions" } },
            { "<leader>rn", vim.lsp.buf.rename,                        mode = "n",          { desc = "Smart Rename" } },
            { "gd",         "<cmd>Telescope lsp_definitions<CR>",      mode = "n",          { desc = "Show definition" } },
            { "gD",         vim.lsp.buf.declaration,                   mode = "n",          { description = "Show Declaration" } },
            { "gr",         "<cmd>Telescope lsp_references<CR>",       mode = "n",          { desc = "Show References" } },
            { "gi",         "<cmd>Telescope lsp_implementations<CR>",  mode = "n",          { desc = "Show Implementations" } },
            { "gt",         "<cmd>Telescope lsp_type_definitions<CR>", mode = "n",          { desc = "Show Type Definition" } },
            { "<leader>D",  "<cmd>Telescope diagnostics bufnr=0<CR>",  mode = "n",          { desc = "Show Diagnostics" } },
            { "<leader>d",  vim.diagnostic.open_float,                 mode = "n",          { desc = "Show line diagnostics" } },
            { "<leader>rs", ":LspRestart<CR>",                         mode = "n",          { desc = "Restart LSP" } },
        },
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.pyright.setup({})
            lspconfig.angularls.setup({})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            })
            telescope.load_extension("ui-select")
        end
    }
}
