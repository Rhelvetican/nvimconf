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
		"rmagatti/auto-session",
		lazy = false,

		opts = {
			supressed_dirs = {
				"~/Projects/",
				"~/Downloads/",
			},
		},
	},

	{
		"marko-cerovac/material.nvim",
		opts = function()
			require("material").setup({
				styles = {
					keywords = { italic = true },
					variables = { italic = true },
					types = { italic = true },
				},

				plugins = {
					"dap",
					"fidget",
					"indent-blankline",
					"nvim-cmp",
					"lspsaga",
					"nvim-web-devicons",
					"telescope",
					"which-key",
				},
			})
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
			"https://codeberg.org/FelipeLema/cmp-async-path",

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

	{ "nvzone/volt", lazy = true },

	{
		"nvzone/menu",
		dependencies = {},
		config = function()
			local map = vim.keymap.set

			map("n", "<C-j>", function()
				require("menu").open("default")
			end, {})

			map("n", "<RightMouse>", function()
				vim.cmd.exec("'normal! \\<RightMouse>'")
				local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
				require("menu").open(options, { mouse = true })
			end)
		end,
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				"lazy.nvim",
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
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

	"tpope/vim-fugitive",

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
		"nvimdev/lspsaga.nvim",

		event = "LspAttach",

		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local map = vim.keymap.set
			map("n", ".c", "<cmd>Lspsaga code_action<CR>")

			require("lspsaga").setup({})
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
		dependencies = {
			"j-hui/fidget.nvim",
		},
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
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			require("ibl").setup({ indent = { highlight = highlight, char = "│" } })
		end,
	},

	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
		cmd = "WhichKey",
		opts = function()
			return {}
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		opts = {
			defaults = {
				prompt_prefix = "   ",
				selection_caret = " ",
				entry_prefix = " ",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.80,
				},
				mappings = {},
			},

			extensions_list = { "themes", "terms" },
			extensions = {},
		},
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
		"vyfor/cord.nvim",
		build = "./build or .\\build",
		event = "VeryLazy",
		opts = function()
			require("cord").setup({
				editor = {
					client = "neovim",
					tooltip = "The Superior Text Editor",
				},

				display = {
					show_repository = false,
				},

				lsp = {
					show_problem_count = true,
					severity = 2,
				},

				text = {
					workspace = "Working on {}",
				},

				buttons = {
					{
						label = "View Plugin",
						url = "https://github.com/vyfor/cord.nvim",
					},
				},
			})
		end,
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		dependencies = {
			"rust-lang/rust.vim",
		},
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
			vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })

			vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })

			vim.keymap.set("n", "<C-p>", function()
				require("hover").hover_switch("previous", {})
			end, { desc = "hover.nvim (previous source)" })

			vim.keymap.set("n", "<C-n>", function()
				require("hover").hover_switch("next", {})
			end, { desc = "hover.nvim (next source)" })

			vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })

			require("hover").setup({
				init = function()
					require("hover.providers.diagnostic")
					require("hover.providers.lsp")
					require("hover.providers.dap")
					require("hover.providers.fold_preview")
				end,

				preview_opts = {
					border = "rounded",
				},
			})
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
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			require("oil").setup({
				default_file_explorer = true,

				columns = {
					"icon",
					"permissions",
					"size",
				},

				win_options = {
					wrap = true,
				},

				view_options = {
					show_hidden = true,
					is_hidden_file = function(name, _)
						return name ~= ".gitignore" and name:sub(1, #".") ~= "."
					end,
				},
			})
		end,
	},

	{
		"simrat39/inlay-hints.nvim",
		opts = function()
			require("inlay-hints").setup({})
		end,
	},
}
