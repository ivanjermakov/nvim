vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "ivanjermakov/mellow.nvim"
    vim.cmd [[colorscheme mellow]]

    use {
        "ivanjermakov/troublesum.nvim",
        config = function()
            require("troublesum").setup()
        end
    }
    use "ivanjermakov/telescope-file-structure.nvim"

    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    use {
        "folke/todo-comments.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/playground"

    use "nois-lang/nois.vim"

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v2.x',
        requires = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
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
    }

    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }

    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    }

    use "norcalli/nvim-colorizer.lua"
    require("colorizer").setup(nil)

    use { "shortcuts/no-neck-pain.nvim", tag = "*", }
    require("no-neck-pain").setup({
        width = 140,
        autocmds = {
            enableOnVimEnter = true,
            enableOnTabEnter = true
        }
    })

    use "mfussenegger/nvim-dap"
    use { "rcarriga/nvim-dap-ui", tag = "*", requires = { "mfussenegger/nvim-dap" } }

    use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }

    use({
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup()
        end
    })

    use "folke/neodev.nvim"

    use "lukas-reineke/indent-blankline.nvim"

    use "folke/flash.nvim"
end)
