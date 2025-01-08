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
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			map({ "n", "v", "o" }, "<leader>tt", "<cmd>ToggleTerm<CR>")
			require("toggleterm").setup({})
		end,
	},

	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
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
		"lewis6991/satellite.nvim",
		config = function()
			require("satellite").setup({})
		end,
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
		lazy = false,
		priority = 9999,
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
					aerial = true,
					snacks = true,
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
		"folke/snacks.nvim",
		event = "VimEnter",
		opts = {
			bigfile = { enabled = true },
			indent = { enabled = true, animate = { enabled = false }, chunk = { enabled = true } },
			input = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},

	{
		"j-hui/fidget.nvim",
		opts = {},
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
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "*",

		opts = {
			keymap = {
				preset = "enter",
				cmdline = { preset = "default" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			completion = {
				keyword = { range = "full" },
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},

			signature = { enabled = true, window = { treesitter_highlighting = false } },

			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},

		opts_extend = { "sources.default" },
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
						{ "diagnostics", color = { gui = "bold" } },
					},
					lualine_c = { { "filename", color = { gui = "bold" } } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { { "location", color = { gui = "bold" } } },
				},
				extensions = { "toggleterm" },
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
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("mason-lspconfig").setup_handlers({
						["rust_analyzer"] = function() end,
					})
				end,
			},
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
			require("plugins.configs.cord")
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

		config = function()
			require("plugins.configs.rustaceanvim")
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
