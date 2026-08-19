vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } })
local treesitter = require("nvim-treesitter")

local parsers = { "lua", "markdown", "markdown_inline", "html", "typescript" }
treesitter.install(parsers)

local function attach(buf, language)
    if not vim.treesitter.language.add(language) then return end
    vim.treesitter.start(buf, language)
    local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil
    if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
end

local available_parsers = treesitter.get_available()
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then return end

        if vim.tbl_contains(treesitter.get_installed("parsers"), language) then
            attach(buf, language)
        elseif vim.tbl_contains(available_parsers, language) then
            treesitter.install(language):await(function() attach(buf, language) end)
        else
            attach(buf, language)
        end
    end,
})
