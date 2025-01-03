---@diagnostic disable: missing-fields
local map = vim.keymap.set

return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"simrat39/inlay-hints.nvim",
		opts = function()
			require("inlay-hints").setup({})
		end,
	},

	{
		"stevearc/dressing.nvim",
		opts = function()
			require("dressing").setup({})
		end,
	},

	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = function()
			local opts = {}

			opts.arg = "leet"
			opts.lang = "rust"

			map({ "n", "v", "o" }, "<leader>ls", "<cmd>Leet submit<CR>")
			map({ "n", "v", "o" }, "<leader>ll", "<cmd>Leet list<CR>")
			map({ "n", "v", "o" }, "<leader>ld", "<cmd>Leet daily<CR>")
			map({ "n", "v", "o" }, "<leader>le", "<cmd>Leet exit<CR>")
			map({ "n", "v", "o" }, "<leader>lr", "<cmd>Leet random<CR>")
			map({ "n", "v", "o" }, "<leader>lb", "<cmd>Leet reset<CR>")
			map({ "n", "v", "o" }, "<leader>li", "<cmd>Leet inject<CR>")
			map({ "n", "v", "o" }, "<leader>lt", "<cmd>Leet desc toggle<CR>")

			return opts
		end,
	},

	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		config = function()
			require("marks").setup({})
		end,
	},

	{
		"lmantw/themify.nvim",
		lazy = false,
		priority = 9999,

		config = function()
			require("themify").setup(require("plugins.themes"))
			map({ "n", "v", "o" }, "<leader>t", "<Cmd>Themify<CR>")
		end,
	},

	{
		"lewis6991/satellite.nvim",
		config = function()
			require("satellite").setup({})
		end,
	},

	{
		"folke/snacks.nvim",
		priority = 9999,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			indent = { enabled = true, animate = { enabled = false }, chunk = { enabled = true } },
			input = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},

	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("plugins.configs.mini")
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				styles = {
					comments = { "italic" },
					keywords = { "italic" },
					variables = { "italic" },
					types = { "bold" },
					functions = { "italic", "bold" },
					miscs = { "italic" },
					properties = { "italic" },
				},

				integrations = {
					cmp = true,
					dap = true,
					mason = true,
					dap_ui = true,
					snacks = true,
					aerial = true,
					lsp_saga = true,
					telescope = true,
					which_key = true,
					treesitter = true,
					treesitter_context = true,
				},
			})
		end,
	},

	{
		"marko-cerovac/material.nvim",

		config = function()
			require("material").setup({
				styles = {
					keywords = { italic = true },
					variables = { italic = true },
					types = { italic = true },
					comments = { italic = true },
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

				lualine_style = "stealth",
			})
		end,
	},

	{
		"projekt0n/github-nvim-theme",
		priority = 9999,
		config = function()
			require("github-theme").setup({
				options = {
					styles = {
						functions = "italic",
						keywords = "bold",
						variables = "italic",
						types = "italic,bold",
						numbers = "bold",
						constants = "bold",
						strings = "italic",
					},

					modules = {
						cmp = true,
						whichkey = true,
						treesitter = true,
						treesitter_context = true,
						lsp_semantic_tokens = true,
						gitsigns = true,
						dapui = true,
						native_lsp = true,
						telescope = true,
						fidget = true,
						mini = true,
					},
				},
			})
		end,
	},

	{
		"Goose97/timber.nvim",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("timber").setup({})
		end,
	},

	{
		"psliwka/vim-dirtytalk",
		build = ":DirtytalkUpdate",
		config = function()
			vim.opt.spelllang = { "en", "programming" }
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
			"f3fora/cmp-spell",
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
			return require("plugins.configs.cmp")
		end,
	},

	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "classic",
				options = {
					softwrap = 32,
				},
			})
		end,
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				"lazy.nvim",
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				{ plugins = "nvim-dap-ui", types = true },
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
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},

		opts = {
			adapter = {
				["rustaceanvim.neotest"] = {},
			},
		},
	},

	{
		"akinsho/bufferline.nvim",
		event = "BufReadPre",
		opts = require("plugins.configs.bufferline"),
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = { theme = "auto" },
				sections = {
					lualine_a = { { "mode", color = { gui = "bold" } } },
					lualine_b = {
						{ "branch", color = { gui = "bold" } },
						{ "diff", color = { gui = "bold" } },
						{
							"diagnostics",
							color = { gui = "bold" },
						},
					},
					lualine_c = { { "filename", color = { gui = "bold" } } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { { "location", color = { gui = "bold" } } },
				},
			})
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
			local map_nv = function(keymap, cmd)
				map({ "n", "v" }, keymap, cmd)
			end

			require("lspsaga").setup({
				ui = {
					button = { "", "" },
				},
			})

			-- Code Actions
			map_nv("<leader>ca", "<cmd>Lspsaga code_action<CR>")

			-- Finder
			map_nv("<leader>cf", "<cmd>Lspsaga finder<CR>")

			-- Gotos
			map_nv("<leader>cg", "<cmd>Lspsaga goto_definition<CR>")
			map_nv("<leader>cp", "<cmd>Lspsaga peek_definition<CR>")
			map_nv("<leader>ctg", "<cmd>Lspsaga goto_type_definition<CR>")
			map_nv("<leader>ctp", "<cmd>Lspsaga peek_type_definition<CR>")

			-- Utils
			map_nv("<leader>cdw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
			map_nv("<leader>cdl", "<cmd>Lspsaga show_line_diagnostics<CR>")
			map_nv("<leader>cdb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
			map_nv("<leader>cdc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

			map_nv("<leader>cdn", "<cmd>Lspsaga diagnostic_jump_next<CR>")
			map_nv("<leader>cdN", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
		end,
	},

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		cmd = { "Mason", "MasonInstall" },
		opts = function()
			require("plugins.configs.mason")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"j-hui/fidget.nvim",
			"williamboman/mason-lspconfig.nvim",
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
			map({ "v", "n" }, "gf", require("actions-preview").code_actions)
			require("actions-preview").setup({
				diff = {
					ctxlen = 2,
				},

				backend = { "nui" },
			})
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
		cmd = "Tele",
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
				on_attach = function(bufnr)
					map("n", "<leader>a{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					map("n", "<leader>a}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})

			map("n", "<leader><C-a>", "<cmd>AerialToggle!<CR>")
		end,
	},

	{
		"vyfor/cord.nvim",
		branch = "client-server",
		version = "*",
		build = ":Cord update",
		opts = function()
			require("cord").setup({
				editor = {
					client = "neovim",
					tooltip = "The Supreme Text Editor",
				},

				text = {
					editing = function(opts)
						local switch_table = {}
						local type, name = opts.filetype, opts.filename

						switch_table["rust"] = function()
							return "Oxidizing " .. name
						end

						switch_table["lua"] = function()
							return "Writing cool lua code at" .. name
						end

						local oldschool = function()
							return "Being oldschool in " .. name
						end

						switch_table["c"] = oldschool
						switch_table["cpp"] = oldschool
						switch_table["h"] = oldschool
						switch_table["hpp"] = oldschool
						switch_table["objc"] = oldschool
						switch_table["objcpp"] = oldschool

						switch_table["zig"] = function()
							return "Writing Zig at " .. name
						end

						local handle = switch_table[type]

						if handle then
							return handle()
						else
							return "Editing " .. opts.filename
						end
					end,

					docs = "Reading docs...",
					dashboard = "At home...",
					vcs = "Managing git...",
				},

				assets = {
					["Cargo.toml"] = {
						text = "Managing Cargo dependencies...",
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

		ft = { "rust" },

		opts = {
			server = {
				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = {
								enable = true,
							},
						},
					},
				},
			},
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
			map("n", "K", require("hover").hover, { desc = "hover.nvim" })

			map("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })

			map("n", "<C-p>", function()
				require("hover").hover_switch("previous", {})
			end, { desc = "hover.nvim (previous source)" })

			map("n", "<C-n>", function()
				require("hover").hover_switch("next", {})
			end, { desc = "hover.nvim (next source)" })

			map("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })

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

			map({ "n", "v" }, "<C-d>bgo", function()
				dapui.open()
			end)
			map({ "n", "v" }, "<C-d>bgc", function()
				dapui.close()
			end)
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

			map("n", "bo", function()
				require("dapui").open({})
			end)
			map("n", "bc", function()
				require("dapui").close({})
			end)
		end,
	},

	{
		"saecki/crates.nvim",
		tag = "stable",
		event = { "BufRead Cargo.toml", "BufRead cargo.toml" },
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
				completion = {
					cmp = {
						enabled = true,
					},
				},
				autoload = true,
				autoupdate = true,
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
		"monaqa/dial.nvim",

		config = function()
			local dialmap = require("dial.map")

			map("n", "<C-a>", function()
				dialmap.manipulate("increment", "normal")
			end)

			map("n", "<C-x>", function()
				dialmap.manipulate("decrement", "normal")
			end)

			map("n", "g<C-a>", function()
				dialmap.manipulate("increment", "gnormal")
			end)

			map("n", "g<C-x>", function()
				dialmap.manipulate("decrement", "gnormal")
			end)

			map("v", "<C-a>", function()
				dialmap.manipulate("increment", "visual")
			end)

			map("v", "<C-x>", function()
				dialmap.manipulate("decrement", "visual")
			end)

			map("v", "g<C-a>", function()
				dialmap.manipulate("increment", "gvisual")
			end)

			map("v", "g<C-x>", function()
				dialmap.manipulate("decrement", "gvisual")
			end)
		end,
	},
}
