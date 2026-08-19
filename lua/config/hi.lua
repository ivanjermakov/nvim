vim.cmd "colorscheme lunaperche"

for _, hi in pairs({ "Normal", "NormalFloat", "FloatBorder", "Special", "Identifier", "Type" }) do
    vim.api.nvim_set_hl(0, hi, { bg = "none" })
end

vim.api.nvim_set_hl(0, "PreProc", { link = "Normal" })

vim.api.nvim_set_hl(0, "Constant", { fg = "#f0c5a9" })
vim.api.nvim_set_hl(0, "String", { fg = "#a6d189" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#9998a8" })
