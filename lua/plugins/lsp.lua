return {
    { "neovim/nvim-lspconfig", },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            require('luasnip.loaders.from_vscode').lazy_load({ exclude = { "all" } })
            luasnip.config.setup({})

            cmp.setup {
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                },
                mapping = cmp.mapping.preset.insert({
                    ["<cr>"] = cmp.mapping.confirm({ select = true }),
                    ["<m-cr>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
                }),
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                },
            }
        end
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.biome.with({
                        filetypes = {
                            "javascript",
                            "typescript",
                            "javascriptreact",
                            "typescriptreact",
                            "json",
                            "jsonc",
                            "css",
                            "graphql",
                        },
                        args = {
                            'check',
                            '--apply',
                            '--linter-enabled=true',
                            '--formatter-enabled=true',
                            '--organize-imports-enabled=true',
                            '--skip-errors',
                            '--stdin-file-path=$FILENAME',
                        },
                    }),
                }
            })
        end
    },
}
