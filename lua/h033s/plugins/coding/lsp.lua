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
    },
    config = function()
        require('fidget').setup({})
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'angularls',
                'tsserver',
                'pyright',
            },
            handlers = {

                function(server_name)
                    require('lspconfig')[server_name].setup{}
                end
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
                ['C-p'] = cmp.mapping.select_prev_item(cmp_select),
                ['C-n'] = cmp.mapping.select_next_item(cmp_select),
                ['C-y'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}
