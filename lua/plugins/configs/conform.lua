return {
	formatters = {
		taplo = {
			env = {
				TAPLO_CONFIG = "~/taplo/config.toml",
			},
		},
	},

	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff format" },
		rust = { "rustfmt", lsp_format = "fallback" },
		toml = { "taplo fmt -", lsp_format = "fallback" },
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
}
