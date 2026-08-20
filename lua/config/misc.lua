vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
local gitsigns = require("gitsigns")
gitsigns.setup()

vim.pack.add({ "https://github.com/chrisgrieser/nvim-spider" })
local spider = require("spider")
spider.setup({
    skipInsignificantPunctuation = false
})
vim.keymap.set({ "n", "o", "x" }, "w", function() spider.motion("w") end)
vim.keymap.set({ "n", "o", "x" }, "e", function() spider.motion("e") end)
vim.keymap.set({ "n", "o", "x" }, "b", function() spider.motion("b") end)

vim.pack.add({ "https://github.com/okuuva/auto-save.nvim" })
local auto_save = require("auto-save")
auto_save.setup({
    debounce_delay = 100,
    condition = function(buf)
        if vim.tbl_contains({ "oil", "query" }, vim.fn.getbufvar(buf, "&filetype")) then
            return false
        end
        if vim.fn.finddir('.git', vim.fn.getcwd() .. ";") == "" then
            return false
        end
        return true
    end
})
