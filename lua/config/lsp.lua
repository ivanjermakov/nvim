local var = require("config.var")

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

    -- disable semantic tokens since they mess up theme highting
    if client.server_capabilities ~= nil then
        client.server_capabilities.semanticTokensProvider = nil
    end

    -- handled by biome
    if client.name == "tsserver" or client.name == "html" or client.name == "cssls" then
        client.server_capabilities.documentFormattingProvider = false
    end

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
    vim.keymap.set(
        "n", "<f25>",
        function() vim.diagnostic.goto_next() end,
        opts
    ) -- <c-f1>
    vim.keymap.set("n", "<m-cr>", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<f6>", vim.lsp.buf.rename, opts)

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
end

require('mason').setup({
    ui = {
        keymaps = {
            toggle_package_expand = "<CR>",
            install_package = "I",
            update_package = "u",
            check_package_version = "c",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "X",
            cancel_installation = "<C-c>",
            apply_language_filter = "<C-f>",
        },
    }
})
require('mason-lspconfig').setup()

local servers = {
    jsonls = {},
    angularls = {},
    tsserver = {},
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importEnforceGranularity = true,
                    importPrefix = "crate",
                },
                checkOnSave = {
                    command = "clippy",
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
    },
    purescriptls = {
        settings = {
            purescript = {
                formatter = "purs-tidy",
            },
        },
    },
    biome = {
        -- enabled = false,
        cmd = { var.dev_path .. "/clone/biome/target/release/biome", "lsp-proxy" }
    },
    typos_lsp = {
        init_options = {
            diagnosticSeverity = "warning"
        }
    }
}

require('neodev').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
})
mason_lspconfig.setup_handlers({
    function(server_name)
        local server = servers[server_name] or {}
        if (server.enabled == false) then
            return
        end
        require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = server,
            filetypes = server.filetypes,
            cmd = server.cmd,
            init_options = server.init_options,
        })
    end,
})
