vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

local function get_highest_severity(bufnr)
    local diags = vim.diagnostic.get(bufnr)
    local highest = vim.diagnostic.severity.HINT
    for _, diag in ipairs(diags) do
        local sev = diag.severity
        if sev ~= nil and sev < highest then
            highest = sev
        end
    end
    return highest
end

local on_attach = function(args)
    local opts = { buffer = args.buf }
    local client = vim.lsp.get_client_by_id(args.id)
    if client == nil then return end

    -- enable selected reference highlighting across the buffer
    vim.api.nvim_create_autocmd("CursorHold", {
        pattern = { "<buffer>" },
        callback = function()
            if client.server_capabilities.documentHighlightProvider then
                vim.lsp.buf.document_highlight()
            end
        end
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
        pattern = { "<buffer>" },
        callback = function()
            if client.server_capabilities.documentHighlightProvider then
                vim.lsp.buf.clear_references()
            end
        end
    })

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
    vim.keymap.set("n", "<f6>", vim.lsp.buf.rename, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("ts_ls", { on_attach = on_attach, capabilities = capabilities })
vim.lsp.enable("ts_ls")

vim.lsp.config("biome", { on_attach = on_attach, capabilities = capabilities })
vim.lsp.enable("biome")

vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
    ---@type lspconfig.settings.lua_ls
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
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
vim.lsp.enable("lua_ls")
