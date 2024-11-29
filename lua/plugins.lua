local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = 'modern',
            delay = 500,
        },
        keys = {
        },
    },
    -- { "bluz71/vim-moonfly-colors", name = "moonfly",       lazy = false, priority = 1000, cond = not vim.g.vscode },
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000 -- Ensure it loads first
    },
    {
        'nvim-telescope/telescope.nvim',
        -- or                              , branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
            }
        },
        cond = not vim.g.vscode
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        cond = not vim.g.vscode
    },
    {
        "mbbill/undotree",
        cond = not vim.g.vscode
    },
    {
        "tpope/vim-surround",
        cond = not vim.g.vscode
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.api.nvim_command, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    'MunifTanjim/prettier.nvim',
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
    },
    "windwp/nvim-ts-autotag",
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    -- {
    --     'romgrk/barbar.nvim',
    --     dependencies = {
    --         'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    --         'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    --     },
    --     init = function() vim.g.barbar_auto_setup = false end,
    --     version = '^1.0.0', -- optional: only update when a new 1.x version is released
    -- },
    { "lukas-reineke/indent-blankline.nvim" },
    'nvim-lualine/lualine.nvim',
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
    },
    'easymotion/vim-easymotion',
    { 'kevinhwang91/nvim-ufo',              dependencies = 'kevinhwang91/promise-async' },
    'numToStr/Comment.nvim',
    "roobert/tailwindcss-colorizer-cmp.nvim",
    'norcalli/nvim-colorizer.lua',
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        }
    },
    'ThePrimeagen/vim-be-good',
    -- {
    --     'glacambre/firenvim',
    --
    --     -- Lazy load firenvim
    --     -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    --     lazy = not vim.g.started_by_firenvim,
    --     build = function()
    --         vim.fn["firenvim#install"](0)
    --     end
    -- },
    'christoomey/vim-tmux-navigator',
    -- 'mfussenegger/nvim-dap',
    -- "jay-babu/mason-nvim-dap.nvim",
    -- 'rcarriga/nvim-dap-ui',
    "nvim-treesitter/nvim-treesitter-context",
    'tikhomirov/vim-glsl',
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
    },
    "github/copilot.vim",
    "luckasRanarison/tree-sitter-hypr",
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    -- {
    --     "epwalsh/obsidian.nvim",
    --     version = "*", -- recommended, use latest release instead of latest commit
    --     lazy = true,
    --     ft = "markdown",
    --     -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    --     -- event = {
    --     --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --     --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --     --   "BufReadPre path/to/my-vault/**.md",
    --     --   "BufNewFile path/to/my-vault/**.md",
    --     -- },
    --     dependencies = {
    --         -- Required.
    --         "nvim-lua/plenary.nvim",
    --
    --         -- see below for full list of optional dependencies 👇
    --     },
    --     opts = {
    --         workspaces = {
    --             -- {
    --             --     name = "personal",
    --             --     path = "~/vaults/personal",
    --             -- },
    --             {
    --                 name = "work",
    --                 path = "~/vaults/work",
    --             },
    --         },
    --
    --         -- see below for full list of options 👇
    --     },
    -- },
    {
        "LunarVim/bigfile.nvim",
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
        }
    },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    { "ellisonleao/glow.nvim", config = true, cmd = "Glow" }
})
