vim.keymap.set('n', '<f32>', require("dap").toggle_breakpoint, {}) -- <c-f8>
vim.keymap.set('n', '<f8>', require("dap").step_over, {})
vim.keymap.set('n', '<f7>', require("dap").step_into, {})
vim.keymap.set('n', '<f20>', require("dap").step_out, {}) -- <s-f8>
vim.keymap.set('n', '<f9>', require("dap").continue, {})
vim.keymap.set('n', '<m-9>', function()
    require("dapui").toggle()
    -- closing dapui window breaks no-neck-pain width for some reason
    require("no-neck-pain").resize({ width = 120 })
end, {})

require("dap-vscode-js").setup({
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "process",
            processId = require('dap.utils').pick_process,
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "jest",
            runtimeExecutable = "node",
            runtimeArgs = {
                "./node_modules/jest/bin/jest.js",
                "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "npm",
            runtimeExecutable = "npm",
            runtimeArgs = function()
                local command = vim.fn.input({ prompt = "npm " })
                local words = {}
                for word in command:gmatch("[^%s]+") do table.insert(words, word) end
                return words
            end,
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
        }
    }
end

require("dapui").setup({
    controls = {
        element = "repl",
        enabled = true,
        icons = {
            disconnect = "d",
            pause = "pa",
            play = "pl",
            run_last = "rl",
            step_back = "sb",
            step_into = "si",
            step_out = "so",
            step_over = "sn",
            terminate = "tr"
        }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
        border = "single",
        mappings = {
            close = { "q", "<Esc>" }
        }
    },
    force_buffers = true,
    icons = {
        collapsed = "▸",
        current_frame = "★",
        expanded = "▼"
    },
    layouts = { {
        elements = {
            { id = "scopes",  size = 0.3 },
            { id = "repl", size = 0.3 },
            { id = "console", size = 0.4 }
        },
        position = "bottom",
        size = 0.4
    } },
    mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
    },
    render = {
        indent = 1,
        max_value_lines = 10
    }
})

vim.fn.sign_define('DapBreakpoint', { text = '⬤', texthl = 'DapBreakpoint' })
vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = vim.g.terminal_color_1 })
