vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<space>", "<nop>")

-- presence of v_i* mappings introduces delay to remapped v_i
for _, map in pairs(vim.api.nvim_get_keymap("v")) do
    if map.lhs:match('^i') then
        vim.api.nvim_del_keymap("v", map.lhs)
    end
end
vim.keymap.set({ "n", "v" }, "h", "i", { noremap = true })
vim.keymap.set({ "n", "v" }, "i", "gk", { noremap = true })
vim.keymap.set({ "n", "v" }, "j", "h", { noremap = true })
vim.keymap.set({ "n", "v" }, "k", "j", { noremap = true })

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

vim.keymap.set("n", "<tab>", function() last_buf() end)

vim.keymap.set("i", "<c-bs>", "<c-w>")
vim.keymap.set("", "<c-del>", "<c-o>de")

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
vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_hunk() end)

vim.keymap.set("n", "<leader>hr", function() require("rest-nvim").run() end)

vim.keymap.set("n", "<m-f>", "<cmd>Oil<cr>")

vim.keymap.set("n", "gl", function()
    local f = vim.fn.expand("<cfile>")
    if #f ~= 0 then
        local cursor = vim.api.nvim_win_get_cursor(0)
        local bufnr = vim.api.nvim_get_current_buf()
        vim.api.nvim_win_set_buf(0, bufnr)
        vim.api.nvim_win_set_cursor(0, cursor)
        vim.cmd("norm! gF")
    end
end)

function last_buf()
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    -- TODO: lastused only counts in whole seconds, meaning that only one switch per second is possible
    -- use BufEnter events to track buffer order more precisely
    table.sort(bufs, function(a, b) return a.lastused > b.lastused end)
    local last
    -- if current buf is unlisted, jump to the first listed, otherwise to the second one
    if vim.o.buflisted then
        last = bufs[2]
    else
        last = bufs[1]
    end
    if last ~= nil then
        vim.api.nvim_set_current_buf(last.bufnr)
    end
end
