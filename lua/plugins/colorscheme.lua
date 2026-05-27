return {
    {
        "ivanjermakov/nellow.nvim",
        priority = 80,
        config = function()
            vim.cmd [[colorscheme nellow]]
            vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
            vim.api.nvim_set_hl(0, "jsxIntrinsicTagName", { link = "Special" })
            vim.api.nvim_set_hl(0, "htmlTagName", { link = "Special" })
            vim.api.nvim_set_hl(0, "typescriptImport", { link = "Keyword" })
            vim.api.nvim_set_hl(0, "typescriptAliasKeyword", { link = "Keyword" })
            vim.api.nvim_set_hl(0, "typescriptStatementKeyword", { link = "Keyword" })
            vim.api.nvim_set_hl(0, "typescriptAsyncFuncKeyword", { link = "Keyword" })
            vim.api.nvim_set_hl(0, "typescriptFuncCallArg", { link = "Normal" })
        end
    }
}
