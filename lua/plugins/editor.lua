return {
    {
        "ivanjermakov/troublesum.nvim",
        config = function()
            require("troublesum").setup()
        end
    },
    {
        "echasnovski/mini.comment",
        config = function()
            require("mini.comment").setup({
                mappings = {
                    comment_line = "<c-/>",
                    comment_visual = "<c-/>",
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
        opts = {}
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false, -- bad perf on big files
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
        "ecthelionvi/NeoColumn.nvim",
        opts = {
            excluded_ft = { "" },
            fg_color = vim.fn.synIDattr(vim.fn.hlID("ColorColumn"), "fg#"),
            bg_color = vim.fn.synIDattr(vim.fn.hlID("ColorColumn"), "bg#"),
            always_on = true,
            NeoColumn = "120"
        }
    },
    {
        "lukas-reineke/virt-column.nvim",
        enabled = false, -- NeoColumn.nvim is more performant
        opts = {
            char = "│"
        }
    },
    {
        "Wansmer/sibling-swap.nvim",
        config = function()
            require("sibling-swap").setup({
                keymaps = {
                    ["<m-.>"] = "swap_with_right",
                    ["<m-,>"] = "swap_with_left",
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
            vim.keymap.set({ "n", "x", "o" }, "m", function() leap.leap({ target_windows = { vim.fn.win_getid() } }) end)
        end
    },
    {
        "chrisgrieser/nvim-spider",
        config = function()
            local spider = require("spider")
            spider.setup({
                skipInsignificantPunctuation = false
            })
            vim.keymap.set({ "n", "o", "x" }, "w", function() spider.motion("w") end)
            vim.keymap.set({ "n", "o", "x" }, "e", function() spider.motion("e") end)
            vim.keymap.set({ "n", "o", "x" }, "b", function() spider.motion("b") end)
        end
    },
    {
        "okuuva/auto-save.nvim",
        opts = {
            debounce_delay = 100,
            condition = function(buf)
                if vim.tbl_contains({ "oil", "query" }, vim.fn.getbufvar(buf, "&filetype")) then
                    return false
                end
                if vim.loop.fs_stat('.git') == nil then
                    return false
                end
                return true
            end
        }
    },
    {
        "Chaitanyabsprip/fastaction.nvim",
        opts = {},
    }
}
