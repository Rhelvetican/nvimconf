require("options")
require("mappings")
require("commands")
require("lsp")

-- bootstrap plugins & lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- path where its going to be installed

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = require("plugins")

require("lazy").setup(plugins, require("lazy_config"))

if vim.g.neovide then
	vim.g.neovide_floating_corner_radius = 0.25
	vim.g.neovide_floating_blur_amount_x = 1.5
	vim.g.neovide_floating_blur_amount_y = 1.5
	vim.g.neovide_cursor_vfx_mode = "railgun"
end

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texth1 = opts.name,
		text = opts.text,
		numh1 = "",
	})
end

sign({ name = "DiagnosticSignError", text = "" })
sign({ name = "DiagnosticSignWarn", text = "" })
sign({ name = "DiagnosticSignHint", text = "" })
sign({ name = "DiagnosticSignInfo", text = "" })

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

vim.o.background = "dark"
vim.cmd("colorscheme bamboo")
