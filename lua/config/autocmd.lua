vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = { "*" },
    nested = true,
    callback = function()
        if #vim.api.nvim_get_option_value("buftype", {}) == 0
            and #vim.api.nvim_get_runtime_file(".git", false) > 0
            and #vim.api.nvim_buf_get_name(0) > 0 then
            -- vim.api.nvim_cmd({ cmd = "write", mods = { silent = true } }, {})
        end
    end
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = { "*" },
    callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
    end
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    pattern = { "*" },
    callback = function()
        vim.cmd("clearjumps")
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    command = "setlocal conceallevel=0"
})

vim.api.nvim_create_autocmd(
    'User',
    {
        pattern = "TSUpdate",
        callback = function()
            require("nvim-treesitter.parsers").wgsl = {
                install_info = {
                    url = "https://github.com/gpuweb/tree-sitter-wgsl",
                    generate = true,
                    generate_from_json = false
                },
                tier = 0
            }
        end
    }
)
vim.treesitter.language.register('wgsl', { 'wgsl' })
