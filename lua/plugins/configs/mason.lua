local map = vim.keymap.set

map({ "n", "o", "v" }, "<leader>m", "<cmd>Mason<CR>")

require("mason").setup({
	ensure_installed = {
		"ast-grep",
		"bacon",
		"bacon-ls",
		"clang-format",
		"clangd",
		"codelldb",
		"cpplint",
		"cpptools",
		"lua-language-server",
		"pylyzer",
		"ruff",
		"rust-analyzer",
		"stylua",
		"taplo",
	},
})
