return {
    { "neovim/nvim-lspconfig", },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require('cmp')

            cmp.setup {
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                },
                mapping = cmp.mapping.preset.insert({
                    ["<cr>"] = cmp.mapping.confirm({ select = true }),
                    ["<m-cr>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
                }),
                sources = {
                    { name = 'nvim_lsp' },
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
                            "check",
                            "--apply",
                            "--linter-enabled=true",
                            "--formatter-enabled=true",
                            "--organize-imports-enabled=true",
                            "--skip-errors",
                            "--stdin-file-path=$FILENAME",
                        },
                    }),
                }
            })
        end
    },
}
