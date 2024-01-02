return {
    {
        "ivanjermakov/troublesum.nvim",
        config = function()
            require("troublesum").setup()
        end
    },
    {
        'echasnovski/mini.comment',
        version = '*',
        config = function()
            require("mini.comment").setup({
                mappings = {
                    comment_line = '<c-/>',
                    comment_visual = '<c-/>',
                }
            })
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = "│"
            },
            scope = {
                enabled = false,
                show_start = false
            }
        }
    },
    {
        "lukas-reineke/virt-column.nvim",
        opts = {
            char = "│"
        }
    },
}
