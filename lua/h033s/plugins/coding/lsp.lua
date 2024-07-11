return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        --Complention
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',

        --Snippets
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        --Lsp Progress
        "j-hui/fidget.nvim",

        --Tool Installer
        "WhoIsSethDaniel/mason-tool-installer",
    },
    config = function()

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('fidget').setup({})
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'angularls',
                'html',
                'cssls',
                'tsserver',
                'pyright',
                'jdtls',
            },
            handlers = {

                -- Cannot setup JDTLS with normal setup
                function(server_name)
                    if server_name ~= 'jdtls' then
                        lspconfig[server_name].setup{
                            capabilities = capabilities
                        }
                    end
                end,

                require('lspconfig')['angularls'].setup({
                    capabilities = capabilities,
                    filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'angular.html' }
                })
            }
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                'java-debug-adapter',
                'java-test',
                'prettier',
                'stylua'
            }
        })

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            completion = {
                preselect = 'item',
                completeopt = 'menu,menuone,noinsert'
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<A-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<A-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path'}
            }),
            window = {
                -- Add borders to completions popups
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}
