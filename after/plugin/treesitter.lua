require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "http", "json" },
    sync_install = true,
    indent = { enable = true },
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
})

require 'nvim-treesitter.configs'.setup({
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
