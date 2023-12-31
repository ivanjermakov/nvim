return {
    {
        "rmagatti/auto-session",
        opts = {
            log_level = "error",
        }
    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = {
                    override = function(opts)
                        opts.anchor = "NW"
                        opts.row = 1
                        return opts
                    end
                },
                select = {
                    telescope = require("telescope.themes").get_cursor()
                }
            })
        end,
    },
    {
        "shortcuts/no-neck-pain.nvim",
        config = function()
            require("no-neck-pain").setup({
                width = 140,
                autocmds = {
                    enableOnVimEnter = true,
                    enableOnTabEnter = true
                },
                buffers = {
                    right = {
                        enabled = false
                    }
                }
            })
        end
    },
    {
        "echasnovski/mini.surround",
        version = "*",
        config = true
    },
    { "folke/neodev.nvim" },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = "<f12>",
            direction = "float",
            highlights = {
                Normal = { link = "Normal" },
                NormalFloat = { link = "NormalFloat" },
                FloatBorder = { link = "FloatBorder" },
            },
            float_opts = {
                width = vim.api.nvim_win_get_width(0) - 1,
                height = vim.api.nvim_win_get_height(0) - 2,
            }
        }
    },
    {
        "rest-nvim/rest.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            result_split_in_place = true,
            result = {
                show_url = true,
                formatters = {
                    json = "jq",
                    html = function(body)
                        return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
                    end
                },
            },
        }
    },
}
