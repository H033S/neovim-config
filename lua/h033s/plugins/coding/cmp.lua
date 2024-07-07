return {
    {
        "L3MON4D3/LuaSnip",
        build = 'make install_jsregexp',
        dependencies = {
            "saadparwaiz1/cmp_luasnip",     -- for autocompletion
            "rafamadriz/friendly-snippets", -- useful snippet
        },

    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = {
                    ["<A-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                    ["<A-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                    ["<A-h>"] = cmp.mapping.scroll_docs(-4),
                    ["<A-l>"] = cmp.mapping.scroll_docs(4),
                    ["<A-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                    ["<ESC>"] = cmp.mapping.abort(),        -- close completion window
                    ["<A-c>"] = cmp.mapping.confirm({ select = false }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer" },
                }
            })
        end,
    }
}
