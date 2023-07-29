vim.api.nvim_create_autocmd("FileType", {
    pattern = {"*"},
    callback = function()
        vim.opt.formatoptions:remove("o")
        -- vim.opt.cindent = true
    end
})
