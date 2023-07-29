vim.api.nvim_create_autocmd("VimEnter", {
    pattern = {"*"},
    callback = function()
        require("zen-mode").open()
    end
})

