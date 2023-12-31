return {
    {
        "ivanjermakov/troublesum.nvim",
        config = function()
            require("troublesum").setup()
        end
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                padding = true,
                sticky = true,
                ignore = nil,
                toggler = {
                    line = "<c-_>",
                    block = "<m-/>",
                },
                opleader = {
                    line = "<c-_>",
                    block = "<m-/>",
                },
                extra = {
                    above = "gcO",
                    below = "gco",
                    eol = "gcA",
                },
                mappings = {
                    basic = true,
                    extra = false,
                },
                pre_hook = nil,
                post_hook = nil,
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
