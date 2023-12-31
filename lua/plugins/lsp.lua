return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        keymaps = {
                            toggle_package_expand = "<CR>",
                            install_package = "I",
                            update_package = "u",
                            check_package_version = "c",
                            update_all_packages = "U",
                            check_outdated_packages = "C",
                            uninstall_package = "X",
                            cancel_installation = "<C-c>",
                            apply_language_filter = "<C-f>",
                        },
                    }
                }
            },
            { "williamboman/mason-lspconfig.nvim" },

            {
                "hrsh7th/nvim-cmp",
                config = function()
                    local cmp = require("cmp")
                    cmp.setup({
                        mapping = cmp.mapping.preset.insert({
                            ["<cr>"] = cmp.mapping.confirm({ select = true }),
                            ["<m-cr>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
                        }),
                        completion = {
                            completeopt = "menu,menuone,noinsert"
                        }
                    })
                end
            },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier
                }
            })
        end
    },
}
