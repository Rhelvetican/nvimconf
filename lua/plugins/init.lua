return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"stevearc/dressing.nvim",
		opts = function()
			require("dressing").setup({})
		end,
	},

	{
		"marko-cerovac/material.nvim",

		opts = function()
			vim.g.material_style = "deep ocean"

			require("material").setup({
				style = {
					keywords = { italic = true },
					functions = { italic = true },
					variables = { italic = true },
					types = { italic = true },
				},

				plugins = {
					"dap",
					"neogit",
					"neotest",
					"nvim-cmp",
					"nvim-web-devicons",
				},

				lualine_style = "stealth",
			})
		end,
	},

	{
		"rmagatti/auto-session",
		lazy = false,

		opts = {
			supressed_dirs = {
				"~/",
				"~/Projects/",
				"~/Downloads/",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },

		config = function()
			require("treesitter-context").setup()
		end,
	},

	{
		"nvim-neotest/nvim-nio",
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},

		config = function()
			vim.keymap.set("n", "<S-g>", "<cmd>Neogit<CR>")
			vim.keymap.set("n", "<C-<S-g>>", "<cmd>Neogit commit<CR>")

			require("neogit").setup({
				console_timeout = 1000,
				filewatcher = {
					interval = 250,
				},
			})
		end,
	},

	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},

		config = function()
			require("neotest").setup({
				require("rustaceanvim.neotest"),
			})
		end,
	},

	{
		"akinsho/bufferline.nvim",
		event = "BufReadPre",
		opts = require("plugins.configs.bufferline"),
	},

	{
		"echasnovski/mini.statusline",
		config = function()
			require("mini.statusline").setup({ set_vim_settings = false })
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"rafamadriz/friendly-snippets",
			"mrcjkb/rustaceanvim",

			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},

			{
				"windwp/nvim-autopairs",
				config = function()
					require("nvim-autopairs").setup()

					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					local cmp = require("cmp")
					cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
		},

		opts = function()
			---@diagnostic disable-next-line: different-requires
			return require("plugins.configs.cmp")
		end,
	},

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		cmd = { "Mason", "MasonInstall" },
		opts = {
			ensure_installed = {
				"ruff",
				"basedpyright",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},

	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("plugins.configs.conform"),
	},

	{
		"aznhe21/actions-preview.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.keymap.set({ "v", "n" }, "gf", require("actions-preview").code_actions)
			require("actions-preview").setup({
				diff = {
					ctxlen = 2,
				},

				backend = { "nui" },
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("ibl").setup({
				indent = { char = "│" },
				scope = { char = "│", highlight = "Comment" },
			})
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		opts = require("plugins.configs.telescope"),
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},

	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			require("aerial").setup({
				filter_kind = false,
				on_attach = function()
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})

			vim.keymap.set("n", "<leader><C-a>", "<cmd>AerialToggle!<CR>")
		end,
	},

	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},

	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		config = function()
			require("neocord").setup({
				logo = "auto",
				logo_tooltip = "NEOVIM /// REPRISE",
				log_level = nil,
			})
		end,
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function()
			local mason = require("mason-registry")
			local codelldb = mason.get_package("codelldb")
			local ext_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = ext_path .. "adapter/codelldb"
			local liblldb_path = ext_path .. "lldb/lib/liblldb.dylib"

			local cfg = require("rustaceanvim.config")

			vim.g.rustaceanvim = {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end,
	},

	{
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup(
				{
					init = function()
						require("hover.providers.lsp")
						require("hover.providers.dap")
						require("hover.providers.diagnostic")
						require("hover.providers.fold_preview")
					end,

					preview_opts = {
						border = "rounded",
					},

					mouse_delay = 250,
				},

				vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" }),
				vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" }),
				vim.keymap.set("n", "<C-p>", function()
					require("hover").hover_switch("previous")
				end, { desc = "hover.nvim (previous source)" }),
				vim.keymap.set("n", "<C-n>", function()
					require("hover").hover_switch("next")
				end, { desc = "hover.nvim (next source)" }),
				vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
			)
		end,
	},

	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()
		end,
	},

	{
		"saecki/crates.nvim",
		tag = "stable",
		dependencies = {
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("crates").setup({
				lsp = {
					enabled = true,
					actions = true,
					completion = true,
					hover = true,
				},
			})
		end,
	},

	{
		"stevearc/oil.nvim",
		opts = function()
			require("oil").setup({
				default_file_explorer = false,
				columns = {
					"icon",
					"permissions",
				},
				view_options = {
					is_hidden_file = function(name, buffer)
						return vim.startswith(name, ".") and not vim.startswith(name, ".git")
					end,
				},
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"simrat39/inlay-hints.nvim",
		opts = function()
			require("inlay-hints").setup({})
		end,
	},
}
