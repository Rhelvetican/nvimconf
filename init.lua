require("options")
require("mappings")
require("commands")
require("lsp")

-- bootstrap plugins & lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- path where its going to be installed

if not vim.uv.fs_stat(lazypath) then
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
local themes = require("plugins.themes")

require("lazy").setup({ themes, plugins }, require("lazy_config"))

if vim.g.neovide then
	vim.opt.linespace = -3

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

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.api.nvim_set_var("t_Cs", "\\e[4:3m")
vim.api.nvim_set_var("t_Ce", "\\e[4:0m")

vim.api.nvim_set_hl(0, "SpellBad", {
	undercurl = true,
})
vim.api.nvim_set_hl(0, "SpellCap", {
	undercurl = true,
})

vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	signs = true,
	underline = true,
	severity_sort = true,
})

vim.wo.relativenumber = true

vim.o.background = "dark"

vim.g.mellow_italic_functions = true
vim.g.mellow_italic_variables = true

vim.cmd("colorscheme onedark_vivid")
