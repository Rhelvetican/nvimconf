return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = function ()
            return require("rose-pine").setup({
                variant = "moon",
                dark_variant = "moon",

                enable = {
                    terminal = true,
                    migrations = true,
                },
            })
        end
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            {
                's1n7ax/nvim-window-picker',
                version = '2.*',
                config = function()
                    require 'window-picker'.setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal', "quickfix" },
                            },
                        },
                    })
                end,
            },
        },

        config = function()
            vim.fn.sign_define("DiagnosticSignError",
                { text = " ", texthl = "DiagnosticSignError" })
            vim.fn.sign_define("DiagnosticSignWarn",
                { text = " ", texthl = "DiagnosticSignWarn" })
            vim.fn.sign_define("DiagnosticSignInfo",
                { text = " ", texthl = "DiagnosticSignInfo" })
            vim.fn.sign_define("DiagnosticSignHint",
                { text = "󰌵", texthl = "DiagnosticSignHint" })

            require("neo-tree").setup({
                enable_git_status = true,
                enable_diagnostics = true,
                sort_function = function(a, b)
                    if a.type == b.type then
                        return a.path < b.path
                    else
                        return a.type < b.type
                    end
                end,
                default_component_configs = {
                    filesystem = {
                        hijack_netrw_behavior = "open_default"
                    }
                }
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    },

    {
        "akinsho/bufferline.nvim",
        event = "BufReadPre",
        opts = require "plugins.configs.bufferline",
    },

    {
        "echasnovski/mini.statusline",
        config = function()
            require("mini.statusline").setup { set_vim_settings = false }
        end,
    },

    -- we use cmp plugin only when in insert mode
    -- so lets lazyload it at InsertEnter event, to know all the events check h-events
    -- completion , now all of these plugins are dependent on cmp, we load them after cmp
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- cmp sources
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",

            --list of default snippets
            "rafamadriz/friendly-snippets",

            -- snippets engine
            {
                "L3MON4D3/LuaSnip",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },

            -- autopairs , autocompletes ()[] etc
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("nvim-autopairs").setup()

                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    local cmp = require "cmp"
                    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },
        },

        -- made opts a function cuz cmp config calls cmp module
        -- and we lazyloaded cmp so we dont want that file to be read on startup!
        opts = function()
            ---@diagnostic disable-next-line: different-requires
            return require "plugins.configs.cmp"
        end,
    },

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonInstall" },
        opts = {},
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "plugins.configs.lspconfig"
        end,
    },

    {
        "stevearc/conform.nvim",
        lazy = true,
        opts = require "plugins.configs.conform",
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("ibl").setup {
                indent = { char = "│" },
                scope = { char = "│", highlight = "Comment" },
            }
        end,
    },

    -- files finder etc
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        opts = require "plugins.configs.telescope",
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },

    {
        "IogaMaster/neocord",
        event = "VeryLazy",
        config = function()
            require("neocord").setup({
                logo = "auto",
                logo_tooltip = "NEOVIM /// REPRISE",
                log_level = "info",
            })
        end
    },

    {
        "mrcjkb/rustaceanvim",
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },

    {
        "mfussenegger/nvim-dap"
    },

    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup({
                lsp = {
                    enabled = true,
                    actions = true,
                    completion = true,
                    hover = true,
                }
            })
        end,
    },

    {
        "stevearc/oil.nvim",
        opts = function ()
            require("oil").setup({
                default_file_explorer = false,
                columns = {
                    "icon",
                    "permissions",
                },
            })
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "ck-zhang/mistake.nvim"
    },
}
