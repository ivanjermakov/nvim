vim.pack.add({ 'https://github.com/nvim-mini/mini.pick' })
local mini_pick = require('mini.pick')
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
