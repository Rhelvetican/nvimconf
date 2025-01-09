return {
	keymap = {
		preset = "enter",
		cmdline = { preset = "super-tab" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 50,
			treesitter_highlighting = false,
		},

		keyword = { range = "full" },
	},

	signature = { enabled = true, window = { treesitter_highlighting = false } },

	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer", "crates", "dictionary" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},

			crates = {
				name = "crates",
				module = "blink.compat.source",
				score_offset = 50,
			},

			dictionary = {
				name = "Dict",
				module = "blink-cmp-dictionary",
				score_offset = -1,

				opts = {
					prefix_min_len = 1,
					output_separator = " ",
					get_command = {
						"rg",
						"--color=never",
						"--no-line-number",
						"--no-messages",
						"--no-filename",
						"--ignore-case",
						"--",
						"${prefix}",
						vim.fn.stdpath("config") .. "/dict/en_dict.txt",
					},
				},
			},
		},
	},
}
