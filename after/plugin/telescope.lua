local builtin = require('telescope.builtin')
vim.keymap.set(
    'n',
    '<m-n>',
    "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--no-ignore','--files', '--hidden', '-g', '!.git', '-g', '!node_modules' }})<cr>"
)
vim.keymap.set('n', '<c-n>', builtin.find_files, {})
vim.keymap.set('n', '<c-f>', builtin.live_grep, {})
vim.keymap.set('n', '<c-e>', function() builtin.buffers({ sort_mru = true }) end, {})
vim.keymap.set("n", "<leader>d", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>r", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>i", builtin.lsp_implementations, {})
vim.keymap.set("n", "<m-d>", builtin.diagnostics, {})

local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        sorting_strategy = "ascending",
        mappings = {
            n = {
                ['<s-del>'] = actions.delete_buffer,
                ['i'] = actions.move_selection_previous,
                ['k'] = actions.move_selection_next,
                ['j'] = false,
                ['<right>'] = actions.select_default,
            },
            i = {
                -- ['<c-h>'] = "which_key",
                ['<s-del>'] = actions.delete_buffer,
                ['<right>'] = actions.select_default,
                ['<esc>'] = actions.close,
                ['<m-up>'] = actions.cycle_history_prev,
                ['<m-down>'] = actions.cycle_history_next,
            }
        }
    }
}

local fb_actions = require("telescope").extensions.file_browser.actions
require("telescope").setup {
    extensions = {
        file_browser = {
            hijack_netrw = true,
            mappings = {
                ['i'] = {
                    ['<Left>'] = fb_actions.goto_parent_dir,
                },
                ['n'] = {
                    ['<Left>'] = fb_actions.goto_parent_dir,
                },
            },
        }
    },
}
require("telescope").load_extension "file_browser"
vim.keymap.set("n", "<m-f>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })

require("telescope").load_extension "file_structure"
vim.keymap.set("n", "<leader>f", ":Telescope file_structure<CR>", { noremap = true })

require("todo-comments").setup({
    signs = false,
    highlight = {
        keyword = "fg",
        before = "fg",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*]],
    },
    search = {
        pattern = [[\b(KEYWORDS)\b]],
    },
    colors = {
        error = { "Todo" },
        warning = { "Todo" },
        info = { "Todo" },
        hint = { "Todo" },
        default = { "Todo" },
        test = { "Todo" }
    },
})
vim.keymap.set({ "n", "i" }, "<m-6>", ":TodoTelescope<cr>")
