vim.pack.add({ "https://github.com/ivanjermakov/plant.nvim" })
local plant = require("plant")
plant.setup({
    create = function(key)
        vim.cmd.terminal()
        vim.o.buflisted = false
        if key == 2 then
            vim.api.nvim_chan_send(vim.bo.channel, "lg\r")
        end
        return vim.api.nvim_get_current_buf()
    end
})
vim.keymap.set({ "n", "t" }, "<f10>", function() plant.open(1) end)
vim.keymap.set({ "n", "t" }, "<f11>", function() plant.open(2) end)
vim.keymap.set({ "n", "t" }, "<f12>", function() plant.open(3) end)

vim.pack.add({ "https://github.com/ivanjermakov/troublesum.nvim" })
local troublesum = require("troublesum")
troublesum.setup()
