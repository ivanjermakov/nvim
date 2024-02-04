return {
    { "neovim/nvim-lspconfig", },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.biome.with({
                        args = {
                            'check',
                            '--apply',
                            '--linter-enabled=true',
                            '--formatter-enabled=true',
                            '--organize-imports-enabled=true',
                            '--skip-errors',
                            '$FILENAME',
                        },
                    }),
                }
            })
        end
    },
}
