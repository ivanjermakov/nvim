local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-n>', builtin.git_files, {})
vim.keymap.set('n', '<c-f>', builtin.live_grep, {})
vim.keymap.set('n', '<c-e>', builtin.buffers, {})
vim.keymap.set("n", "<leader>f", builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "<leader>b", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>i", builtin.lsp_implementations, {})

require('telescope').setup{
    defaults = {
        mappings = {
            n = {
                ['<s-del>'] = require('telescope.actions').delete_buffer
            },
            i = {
                ["<c-h>"] = "which_key",
                ['<s-del>'] = require('telescope.actions').delete_buffer
            }
        }
    }
}
