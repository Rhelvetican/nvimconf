require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "vim", "vimdoc", "rust" },

    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = { enable = true },
}
