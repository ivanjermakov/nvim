vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<space>", "<nop>")

vim.keymap.set({ "n", "v" }, "h", "i")
vim.keymap.set({ "n", "v" }, "i", "h")
vim.keymap.set({ "n", "v" }, "i", "gk")
vim.keymap.set({ "n", "v" }, "j", "h")
vim.keymap.set({ "n", "v" }, "k", "gj")
vim.keymap.set({ "n", "v" }, "a", "a")

vim.keymap.set({ "n", "v" }, "I", "<c-u>zz")
vim.keymap.set({ "n", "v" }, "K", "<c-d>zz")

vim.keymap.set({ "n" }, "U", "<c-r>")

vim.keymap.set({ "n" }, ">", ">>")
vim.keymap.set({ "n" }, "<", "<<")
vim.keymap.set({ "v" }, ">", ">gv")
vim.keymap.set({ "v" }, "<", "<gv")

vim.keymap.set({ "n", "v" }, "y", [["+y]])
vim.keymap.set("v", "p", [["_dP]])
vim.keymap.set("v", "x", [["_x]])
vim.keymap.set({ "n", "v" }, "c", [["_c]])

vim.keymap.set("i", "<c-c>", "<Esc>")

vim.keymap.set("n", "<tab>", "<c-^>")

vim.keymap.set("i", "<c-h>", "<esc>dbxi")
vim.keymap.set("i", "<c-del>", "<c-o>de")

vim.keymap.set("n", "Q", "@q")
vim.keymap.set("v", "Q", ":norm @q<cr>")

vim.keymap.set("n", "<c-r>", ":%s//g<left><left>")

vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>a", "ggVG")
vim.keymap.set("n", "<leader>v", "<c-v>")
vim.keymap.set("n", "<leader>o", ":source $MYVIMRC<cr>", { silent = true })

vim.keymap.set("n", "<m-i>", ":wincmd k<cr>", { silent = true })
vim.keymap.set("n", "<m-k>", ":wincmd j<cr>", { silent = true })
vim.keymap.set("n", "<m-j>", ":wincmd h<cr>", { silent = true })
vim.keymap.set("n", "<m-l>", ":wincmd l<cr>", { silent = true })

vim.keymap.set("n", "<c-w>", "<nop>")

vim.keymap.set("n", "<esc>", function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative == "win" then
            vim.api.nvim_win_close(win, false)
        end
    end
end)

vim.keymap.set("v", "<leader>s", [[:s/, /,\r/g<cr>]])

vim.keymap.set("t", "<esc>", [[<c-\><c-n>]])
vim.keymap.set("n", "<f12>", [[<c-\><c-n>]])

vim.keymap.set("n", "<leader>n", ":NoNeckPain<cr>")
vim.keymap.set("n", "<leader>gb", function() require("gitsigns").blame_line() end)
vim.keymap.set("n", "<leader>gd", function()
    for _ = 1, 2 do require("gitsigns").preview_hunk() end
end)

vim.keymap.set("n", "<leader>hr", function() require("rest-nvim").run() end)

vim.keymap.set("n", "gl", function()
    local f = vim.fn.expand("<cfile>")
    if #f ~= 0 then
        local cursor = vim.api.nvim_win_get_cursor(0)
        local bufnr = vim.api.nvim_get_current_buf()
        require("toggleterm").toggle(0)
        vim.api.nvim_win_set_buf(0, bufnr)
        vim.api.nvim_win_set_cursor(0, cursor)
        vim.cmd("norm! gF")
    end
end)

