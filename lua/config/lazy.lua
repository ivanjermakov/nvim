local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "ivanjermakov/mellow.nvim",
        config = function()
            vim.cmd [[colorscheme mellow]]
        end
    },
    {
        "ivanjermakov/troublesum.nvim",
        config = function()
            require("troublesum").setup()
        end
    },
    "ivanjermakov/telescope-file-structure.nvim",

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    "nvim-treesitter/playground",

    "nois-lang/nois.vim",

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        keymaps = {
                            toggle_package_expand = "<CR>",
                            install_package = "I",
                            update_package = "u",
                            check_package_version = "c",
                            update_all_packages = "U",
                            check_outdated_packages = "C",
                            uninstall_package = "X",
                            cancel_installation = "<C-c>",
                            apply_language_filter = "<C-f>",
                        },
                    }
                }
            },
            { "williamboman/mason-lspconfig.nvim" },

            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup(nil)
        end
    },

    "shortcuts/no-neck-pain.nvim",

    "mfussenegger/nvim-dap",
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" }
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = { "mfussenegger/nvim-dap" }
    },
    {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    },

    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end
    },

    "folke/neodev.nvim",

    "lukas-reineke/indent-blankline.nvim",
    {
        "lukas-reineke/virt-column.nvim",
        opts = {
            char = "│"
        }
    },

    {
        "folke/flash.nvim",
        config = function()
            require("flash").setup({
                label = {
                    uppercase = false
                },
                modes = {
                    char = {
                        jump_labels = true
                    }
                }
            })
        end
    },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = "<f12>",
            direction = "float",
            highlights = {
                Normal = { link = "Normal" },
                NormalFloat = { link = 'NormalFloat' },
                FloatBorder = { link = 'FloatBorder' },
            }
        }
    }
})

require("no-neck-pain").setup({
    width = 140,
    autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true
    },
    buffers = {
        right = {
            enabled = false
        }
    }
})
