vim.pack.add({ "https://github.com/nvim-mini/mini.pick" })
local mini_pick = require("mini.pick")

vim.pack.add({ "https://github.com/nvim-mini/mini.extra" })
local mini_extra = require("mini.extra")
mini_extra.setup()

mini_pick.setup({
    window = {
        config = {
            width = vim.o.columns,
            height = vim.o.lines,
        }
    }
})
vim.keymap.set({ "n" }, "<c-n>", function() mini_pick.builtin.files() end)
vim.keymap.set({ "n" }, "<c-e>", function() mini_pick.builtin.buffers() end)
vim.keymap.set({ "n" }, "<c-f>", function() mini_pick.builtin.grep_live() end)
vim.keymap.set({ "n" }, "<leader>d", function() mini_extra.pickers.lsp({scope = "definition"}) end)
vim.keymap.set({ "n" }, "<leader>r", function() mini_extra.pickers.lsp({scope = "references"}) end)
vim.keymap.set({ "n" }, "<leader>f", function() mini_extra.pickers.lsp({scope = "document_symbol"}) end)

