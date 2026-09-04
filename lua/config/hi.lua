vim.cmd "colorscheme lunaperche"

vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#ffffff" })
for _, hi in pairs({ "Special", "Identifier", "Type", "WinSeparator", "MiniPickNormal" }) do
    vim.api.nvim_set_hl(0, hi, { link = "Normal" })
end
for _, hi in pairs({ "NormalFloat", "FloatBorder" }) do
    vim.api.nvim_set_hl(0, hi, { bg = "#1b1b1d" })
end

vim.api.nvim_set_hl(0, "Visual", { bg = "#3e3e43" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1b1b1d" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#57575f" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#57575f" })
vim.api.nvim_set_hl(0, "MatchParen", { fg = "#f0c5a9" })

vim.api.nvim_set_hl(0, "PreProc", { link = "Normal" })

vim.api.nvim_set_hl(0, "Constant", { fg = "#f0c5a9" })
vim.api.nvim_set_hl(0, "String", { fg = "#a6d189" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#9998a8" })

vim.api.nvim_set_hl(0, "@keyword", { fg = "#d3a8ef" })
vim.api.nvim_set_hl(0, "@keyword.import", { link = "@keyword" })
vim.api.nvim_set_hl(0, "@keyword.conditional", { link = "@keyword" })
vim.api.nvim_set_hl(0, "@variable.builtin", { link = "@keyword" })
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "@constant" })

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#ff8e8f" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#f0c5a9" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#d3a8ef" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#d3a8ef" })
