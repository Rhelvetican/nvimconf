return {
	async = true,
	"folke/tokyonight.nvim",
	{
		"marko-cerovac/material.nvim",
		opts = function()
			require("material").setup({
				styles = {
					keywords = { italic = true },
					variables = { italic = true },
					types = { italic = true },
				},

				plugins = {
					"dap",
					"fidget",
					"indent-blankline",
					"nvim-cmp",
					"lspsaga",
					"nvim-web-devicons",
					"telescope",
					"which-key",
				},

				lualine_style = "stealth",
			})
		end,
	},
}
