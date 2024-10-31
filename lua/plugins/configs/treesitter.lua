require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python", "vim", "vimdoc", "rust", "ninja", "rst" },

	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = { enable = true },
})
