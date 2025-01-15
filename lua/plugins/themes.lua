return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 9999,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				styles = {
					comments = { "italic" },
					keywords = { "italic" },
					variables = { "italic" },
					types = { "bold" },
					functions = { "italic", "bold" },
					miscs = { "italic" },
					properties = { "italic" },
				},

				integrations = {
					blink_cmp = true,
					cmp = true,
					dap = true,
					mason = true,
					dap_ui = true,
					aerial = true,
					snacks = true,
					lsp_saga = true,
					telescope = true,
					which_key = true,
					treesitter = true,
					treesitter_context = true,
				},
			})
		end,
	},

	{
		"olimorris/onedarkpro.nvim",
		config = function()
			require("onedarkpro").setup({
				styles = {
					types = "bold,italic",
					methods = "bold",
					keywords = "italic",
					constants = "bold",
					functions = "italic",
					variables = "italic",
					parameters = "italic",
					conditionals = "italic",
				},

				colors = {
					cursorline = "#282C34",
					bg = "#121416",
				},

				options = {
					cursorline = true,
				},
			})
		end,
	},

	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({})
		end,
	},
}
