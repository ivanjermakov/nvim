local lsp = require("lsp-zero").preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "rust_analyzer",
    "purescriptls",
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- disable semantic tokens since they mess up theme highting
    client.server_capabilities.semanticTokensProvider = nil

    vim.keymap.set("n", "<leader>l", vim.lsp.buf.format)
    vim.keymap.set("n", "<c-q>", function()
        for _ = 1, 2 do vim.lsp.buf.hover() end
    end, opts)
    vim.keymap.set(
        "n", "<f2>",
        function() vim.diagnostic.goto_next({ severity = get_highest_severity(0) }) end,
        opts
    )
    vim.keymap.set(
        "n", "<f14>",
        function() vim.diagnostic.goto_prev({ severity = get_highest_severity(0) }) end,
        opts
    ) -- <s-f2>
    vim.keymap.set("n", "<m-cr>", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<f6>", vim.lsp.buf.rename, opts)
    vim.keymap.set(
        "n",
        "<leader>o",
        function()
            vim.lsp.buf.execute_command({
                command = "_typescript.organizeImports",
                arguments = { vim.api.nvim_buf_get_name(0) },
                title = ""
            })
        end,
        opts
    )

    -- enable selected reference highlighting across the buffer
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd("CursorHold", {
            pattern = { "<buffer>" },
            callback = function()
                vim.lsp.buf.document_highlight()
            end
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            pattern = { "<buffer>" },
            callback = function()
                vim.lsp.buf.clear_references()
            end
        })
    end
end)

lsp.set_preferences({
    suggest_lsp_servers = true,
    set_lsp_keymaps = false,
    sign_icons = {}
})

vim.diagnostic.config({
    virtual_text = false,
})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            assist = {
                importEnforceGranularity = true,
                importPrefix = 'crate',
            },
            checkOnSave = {
                command = 'clippy',
            },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },
            completion = {
                snippets = "none"
            }
        },
    },
}
lspconfig.purescriptls.setup {
    settings = {
        purescript = {
            formatter = "purs-tidy",
        },
    },
}

local cmp = require 'cmp'
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<m-cr>'] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
    }),
    completion = {
        completeopt = 'menu,menuone,noinsert'
    }
})

lsp.setup()

function get_highest_severity(bufnr)
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
