require("nvim-treesitter.configs").setup({
	modules = {},
	sync_install = true,

	ignore_install = {},
	ensure_installed = {
		"lua",
		"python",
		"vim",
		"vimdoc",
		"rst",
		"nu",
		"gitignore",
		"markdown",
		"json",
		"toml",
	},

	autotag = { enable = true },
	indent = { enable = true },
	highlight = {
		enable = true,
	},
})
