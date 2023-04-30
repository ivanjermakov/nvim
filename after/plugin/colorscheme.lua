require("catppuccin").setup({
    flavour = "mocha",
    color_overrides = {
        all = {
            base = "#111111",
            mantle = "#111111",
            crust = "#111111",
        }
    }
})

vim.cmd.colorscheme "catppuccin"

