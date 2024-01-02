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
    {
        "ivanjermakov/plant.nvim",
        config = function()
            require("plant").setup({
                create = function(key)
                    if key == 2 then
                        vim.cmd(":terminal lg")
                    else
                        vim.cmd(":terminal")
                    end
                    vim.cmd(":setlocal nobuflisted")
                    return vim.api.nvim_get_current_buf()
                end
            })

            vim.keymap.set({ "n", "t" }, "<f10>", function() require("plant").open(1) end)
            vim.keymap.set({ "n", "t" }, "<f11>", function() require("plant").open(2) end)
            vim.keymap.set({ "n", "t" }, "<f12>", function() require("plant").open(3) end)
        end
    }
}
