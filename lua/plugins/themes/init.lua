return {
	-- Enable async loading.
	async = true,

	"folke/tokyonight.nvim",
	"marko-cerovac/material.nvim",
	"catppuccin/nvim",
	"scottmckendry/cyberdream.nvim",

	{
		"nyoom-engineering/oxocarbon.nvim",
		config = {},
	},

	{
		"savq/melange-nvim",
		branch = "master",
	},

	{
		"AlexvZyl/nordic.nvim",
		config = {},
	},

	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({})
		end,
	},
}
