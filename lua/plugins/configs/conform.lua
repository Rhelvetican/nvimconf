return {
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        rust = { "rustfmt", lsp_format = "fallback" },
    },

    format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
    },
}
