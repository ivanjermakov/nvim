return {
    { "neovim/nvim-lspconfig" },
    {
        "saghen/blink.cmp",
        event = "VimEnter",
        version = "1.*",
        opts = {
            keymap = {
                preset = "none",
                ["<up>"] = { "select_prev", "fallback" },
                ["<down>"] = { "select_next", "fallback" },
                ["<cr>"] = { "accept", "fallback" },
            },
            sources = {
                default = { "lsp", "path", "buffer" },
            },
            signature = { enabled = true },
        }
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvimtools/none-ls-extras.nvim", },
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
