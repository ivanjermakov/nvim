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
vim.keymap.set({ "n" }, "<leader>d", function()
    vim.lsp.buf.definition({
        on_list = function(opts)
            local items = opts.items or {}
            if #items == 0 then return end
            if #items == 1 then
                local item = items[1]
                vim.cmd.edit(vim.fn.fnameescape(item.filename))
                vim.api.nvim_win_set_cursor(0, { item.lnum, math.max(item.col - 1, 0) })
                return
            end
            mini_extra.pickers.lsp({ scope = "definition" })
        end,
    })
end)
vim.keymap.set({ "n" }, "<leader>r", function() mini_extra.pickers.lsp({ scope = "references" }) end)
vim.keymap.set({ "n" }, "<leader>f", function() mini_extra.pickers.lsp({ scope = "document_symbol" }) end)

-- TODO: v_i is broken
-- vim.pack.add({ "https://github.com/nvim-mini/mini.ai" })
-- local mini_ai = require("mini.ai")
-- mini_ai.setup()

vim.pack.add({ "https://github.com/nvim-mini/mini.comment" })
local mini_comment = require("mini.comment")
mini_comment.setup({
    mappings = {
        comment_line = "<c-/>",
        comment_visual = "<c-/>",
    }
})

vim.pack.add({ "https://github.com/nvim-mini/mini.surround" })
local mini_surround = require("mini.surround")
mini_surround.setup()
