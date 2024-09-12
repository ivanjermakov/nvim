return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
                    layout_config = {
                        height = { padding = 0 },
                        width = { padding = 0 },
                    },
                    sorting_strategy = "ascending",
                    mappings = {
                        n = {
                            ["<s-del>"] = actions.delete_buffer,
                            ["i"] = actions.move_selection_previous,
                            ["k"] = actions.move_selection_next,
                            ["j"] = false,
                            ["<right>"] = actions.select_default,
                        },
                        i = {
                            ["<s-del>"] = actions.delete_buffer,
                            ["<esc>"] = actions.close,
                            ["<m-up>"] = actions.cycle_history_prev,
                            ["<m-down>"] = actions.cycle_history_next,
                        }
                    }
                },
            })

            telescope.load_extension("aerial")
            vim.keymap.set("n", "<leader>f", ":Telescope aerial<CR>", { noremap = true })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<m-n>", function() builtin.find_files({ hidden = true, no_ignore = true }) end, {})
            vim.keymap.set("n", "<c-n>", builtin.find_files, {})
            vim.keymap.set("n", "<c-f>", builtin.live_grep, {})
            vim.keymap.set("n", "<c-e>", function() builtin.buffers({ sort_mru = true }) end, {})
            vim.keymap.set("n", "<leader>d", builtin.lsp_definitions, {})
            vim.keymap.set("n", "<leader>r", builtin.lsp_references, {})
            vim.keymap.set("n", "<leader>i", builtin.lsp_implementations, {})
            vim.keymap.set("n", "<m-d>", function() builtin.diagnostics({ severity_bound = 0, bufnr = 0 }) end, {})
            vim.keymap.set("n", "<m-D>", function() builtin.diagnostics({ severity_bound = 0 }) end, {})
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({
                signs = false,
                highlight = {
                    keyword = "fg",
                    before = "fg",
                    after = "fg",
                    pattern = [[.*<(KEYWORDS)\s*]],
                },
                search = {
                    pattern = [[\b(KEYWORDS)\b]],
                },
                colors = {
                    error = { "Todo" },
                    warning = { "Todo" },
                    info = { "Todo" },
                    hint = { "Todo" },
                    default = { "Todo" },
                    test = { "Todo" }
                },
            })
            vim.keymap.set({ "n", "i" }, "<m-6>", ":TodoTelescope<cr>")
        end
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
        'stevearc/aerial.nvim',
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
    }
}
