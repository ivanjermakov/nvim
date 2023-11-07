vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        -- vim.opt.cindent = true
    end
})

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    pattern = { "*" },
    nested = true,
    callback = function()
        if #vim.api.nvim_get_option_value("buftype", {}) == 0
            and #vim.api.nvim_get_runtime_file(".git", false) > 0
            and #vim.api.nvim_buf_get_name(0) > 0 then
            vim.api.nvim_cmd({ cmd = "write", mods = { silent = true } }, {})
        end
    end
})
