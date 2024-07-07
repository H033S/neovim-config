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
        config = function()
            local lspconfig = require("lspconfig")

            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                local opts = { noremap = true, silent = true }
                buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                --     opts)
                -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                -- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                { virtual_text = false, signs = false }
            )

            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {

                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                    workspace = {
                        library = {
                            vim.fn.expand "$VIMRUNTIME/lua",
                            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                        },
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                }
            })


            local servers = { "tsserver", "pyright", 'html', 'cssls', 'angularls' }
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup { on_attach = on_attach, capabilities = capabilities }
            end
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
