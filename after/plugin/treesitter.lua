require'nvim-treesitter.configs'.setup {
    ensure_installed = { "help", "javascript", "typescript", "c", "lua", "rust" },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-w>",
            node_incremental = "<c-w>",
            scope_incremental = ".",
            node_decremental = ",",
        },
    },
}

