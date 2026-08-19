vim.pack.add({ "https://github.com/saghen/blink.lib", "https://github.com/saghen/blink.cmp" })
local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({
    keymap = {
        preset = "none",
        ["<up>"] = { "select_prev", "fallback" },
        ["<down>"] = { "select_next", "fallback" },
        ["<cr>"] = { "accept", "fallback" },
    },
    sources = {
        default = { "lsp", "path" },
    },
    completion = {
        list = {
            selection = { auto_insert = false }
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 0
        }
    },
    signature = { enabled = true },
    fuzzy = {
        implementation = "lua"
    }
})
