require("nvim-treesitter.configs").setup({
	modules = {},

	auto_install = true,
	sync_install = true,

	ignore_install = {},
	ensure_installed = { "lua", "python", "vim", "vimdoc", "rust", "ninja", "rst", "nu" },

	highlight = {
		enable = true,
	},
})
