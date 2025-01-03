require("nvim-treesitter.configs").setup({
	modules = {},

	auto_install = true,
	sync_install = true,

	ignore_install = {},

	ensure_installed = {
		"c",
		"cmake",
		"cpp",
		"objc",
		"lua",
		"python",
		"vim",
		"vimdoc",
		"rust",
		"ninja",
		"rst",
		"nu",
		"gitignore",
		"markdown",
		"json",
		"ron",
		"toml",
	},

	autotag = { enable = true },
	indent = { enable = true },
	highlight = {
		enable = true,
	},
})
