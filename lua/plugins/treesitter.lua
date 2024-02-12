local var = require("config.var")

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
            })
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.typescript = {
                install_info = {
                    url = var.dev_path .. "/clone/tree-sitter-typescript/typescript",
                    files = { "src/parser.c", "src/scanner.c" },
                },
            }
            parser_config.nois = {
                install_info = {
                    url = var.dev_path .. "/tree-sitter-nois",
                    files = { "src/parser.c" },
                },
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" }
    },
}
