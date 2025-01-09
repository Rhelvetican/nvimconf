return {
	keymap = {
		preset = "enter",
		cmdline = { preset = "default" },
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
		default = { "lazydev", "lsp", "path", "snippets", "buffer", "emoji", "dictionary" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},

			emoji = {
				module = "blink-emoji",
				name = "Emoji",
				opts = { insert = true },
			},

			dictionary = {
				module = "blink-cmp-dictionary",
				name = "Dict",
			},
		},
	},
}
