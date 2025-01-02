local config = {}
local map = vim.keymap.set

config.ensure_installed = {
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
}

map({ "n", "o", "v" }, "<leader>m", "<cmd>Mason<CR>")

require("mason").setup(config)
