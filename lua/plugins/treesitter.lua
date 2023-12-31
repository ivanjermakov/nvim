return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<c-w>",
                        node_incremental = "<c-w>",
                        scope_incremental = false,
                        node_decremental = ",",
                    },
                },
                textobjects = {
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>s"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>S"] = "@parameter.inner",
                        },
                    },
                },

            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" }
    },
    { "nvim-treesitter/playground" },
}
