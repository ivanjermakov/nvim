return {
    {
        "ivanjermakov/nellow.nvim",
        priority = 80,
        config = function()
            vim.cmd [[colorscheme nellow]]
            vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
            vim.api.nvim_set_hl(0, "jsxIntrinsicTagName", { link = "Special" })
            vim.api.nvim_set_hl(0, "htmlTagName", { link = "Special" })
        end
    }
}
