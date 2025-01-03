local map = vim.keymap.set

map({ "n", "o", "v" }, "<leader>m", "<cmd>Mason<CR>")

-- add binaries installed by mason.nvim to path
local is_windows = vim.uv.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and "; " or ":") .. vim.env.PATH

require("mason").setup({
	PATH = "prepend",
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
