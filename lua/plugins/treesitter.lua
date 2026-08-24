return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
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

            local parsers = require("nvim-treesitter.parsers")
            parsers.wgsl = {
                install_info = {
                    url = "https://github.com/gpuweb/tree-sitter-wgsl",
                    branch = "main",
                    files = {
                        "src/parser.c",
                        "src/scanner.c",
                    },
                    generate_requires_npm = true,
                    requires_generate_from_grammar = true,
                },
                filetype = "wgsl",
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
    },
}
