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
                    comment_line = '<c-_>',
                    comment_visual = '<c-_>',
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
    {
        "Wansmer/sibling-swap.nvim",
        config = function()
            require('sibling-swap').setup({
                keymaps = {
                    ['<m-.>'] = 'swap_with_right',
                    ['<m-,>'] = 'swap_with_left',
                },
            })
        end
    },
    {
        "ggandor/leap.nvim",
        config = function()
            local leap = require("leap")
            leap.opts.safe_labels = "sfnut"
            leap.opts.labels = "sfnjklhodweimbuyvrgtaqpcxz"
            vim.keymap.set({ 'n', 'x', 'o' }, 'm', function() leap.leap({ target_windows = { vim.fn.win_getid() } }) end)
        end
    }
}
