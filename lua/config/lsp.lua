vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }

local on_attach = function(args)
    local opts = { buffer = args.buf }
    local client = vim.lsp.get_client_by_id(args.id)

    vim.keymap.set("n", "<leader>l", function() vim.lsp.buf.format({ timeout_ms = 10 * 1000 }) end)
    vim.keymap.set("n", "<c-q>", function()
        for _ = 1, 2 do vim.lsp.buf.hover() end
    end, opts)
    vim.keymap.set(
        "n", "<f2>",
        function() vim.diagnostic.jump({ count = 1, float = true, severity = get_highest_severity(0) }) end,
        opts
    )
    -- <s-f2>
    vim.keymap.set(
        "n", "<f14>",
        function() vim.diagnostic.jump({ count = -1, float = true, severity = get_highest_severity(0) }) end,
        opts
    )
    -- <c-f1>
    vim.keymap.set(
        "n", "<f25>",
        function() vim.diagnostic.jump({ count = 1, float = true }) end,
        opts
    )
    vim.keymap.set("n", "<m-cr>", function() fastaction.code_action() end, opts)
    vim.keymap.set("n", "<f6>", vim.lsp.buf.rename, opts)
end

vim.lsp.config('ts_ls', { on_attach = on_attach })
vim.lsp.enable('ts_ls')

vim.lsp.config('biome', { on_attach = on_attach })
vim.lsp.enable('biome')

vim.lsp.config('lua_ls', {
    on_attach = on_attach,
    ---@type lspconfig.settings.lua_ls
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            workspace = {
                preloadFileSize = 10000,
                library = {
                    vim.env.VIMRUNTIME,
                }
            },
        },
    },
})
vim.lsp.enable('lua_ls')

