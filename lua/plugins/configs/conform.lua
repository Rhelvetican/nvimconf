return {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff" },
        rust = { "rustfmt", lsp_format = "fallback" },
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
}
