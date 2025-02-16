local var = require("config.var")
local fastaction = require("fastaction")

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

    -- disable semantic tokens since they mess up theme highlighting
    -- if client.server_capabilities ~= nil and client.server_capabilities.semanticTokensProvider ~= nil then
    --     client.server_capabilities.semanticTokensProvider = nil
    -- end

    -- handled by biome
    if client.name == "ts_ls" or client.name == "html" or client.name == "cssls" then
        client.server_capabilities.documentFormattingProvider = false
    end

    vim.keymap.set("n", "<leader>l", function() vim.lsp.buf.format({ timeout_ms = 10 * 1000 }) end)
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
    vim.keymap.set("n", "<m-cr>", function() fastaction.code_action() end, opts)
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

local angularls_cmd = {
    "ngserver", "--stdio", "--tsProbeLocations", "/usr/lib/node_modules", "--ngProbeLocations", "/usr/lib/node_modules"
}
local servers = {
    jsonls = {},
    lua_ls = {},
    angularls = {
        cmd = angularls_cmd,
        on_new_config = function(new_config)
            new_config.cmd = angularls_cmd
        end,
    },
    ts_ls = {},
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importEnforceGranularity = true,
                    importPrefix = "crate",
                },
                checkOnSave = {
                    command = "clippy",
                    extraArgs = { "--target-dir", "target/check" }
                },
                diagnostics = {
                    enable = true,
                    experimental = {
                        enable = true,
                    },
                },
                completion = {
                    callable = {
                        snippets = "none"
                    }
                }
            },
        }
    },
    purescriptls = {
        settings = {
            purescript = {
                formatter = "purs-tidy",
            },
        }
    },
    biome = {
        cmd = { var.dev_path .. "/clone/biome/target/release/biome", "lsp-proxy" }
    },
    typos_lsp = {
        init_options = {
            diagnosticSeverity = "Hint"
        }
    },
    hls = {},
    gleam = {
        cmd = { var.dev_path .. "/clone/gleam/target/release/gleam", "lsp" }
    },
    cssls = {},
    glsl_analyzer = {},
    clojure_lsp = {},
    zls = {},
}

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.semanticTokens = nil
for name, server in pairs(servers) do
    if (server.enabled ~= false) then
        lspconfig[name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = server.settings,
            filetypes = server.filetypes,
            cmd = server.cmd,
            init_options = server.init_options,
            on_new_config = server.on_new_config,
        })
    end
end
