return {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_import" },
		rust = { "rustfmt", lsp_format = "fallback" },
		toml = { "taplo fmt", lsp_format = "fallback" },
		zig = { "zig fmt .", lsp_format = "fallback" },
	},

	formatters = {
		["clang_format"] = {
			inherit = true,
			command = "clang-format",
			args = { "-assume-filename", "$FILENAME", '--style="{BasedOnStyle: llvm, IndentWidth: 4}"' },
		},
		["clang-format"] = {
			inherit = true,
			command = "clang-format",
			args = { "-assume-filename", "$FILENAME", '--style="{BasedOnStyle: llvm, IndentWidth: 4}"' },
		},
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
}
