local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end
    -- disable semantic tokens since they mess up theme highting
    client.server_capabilities.semanticTokensProvider = nil

    vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>l", vim.lsp.buf.format)
    vim.keymap.set("n", "<c-q>", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<f3>", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<f2>", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader><cr>", vim.lsp.buf.code_action, opts)

    -- enable selected reference highlighting across the buffer
    -- if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
            ]],
        false)
    -- end
end)

lsp.set_preferences({
    suggest_lsp_servers = true,
    set_lsp_keymaps = false,
    sign_icons = {}
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = false,
})
