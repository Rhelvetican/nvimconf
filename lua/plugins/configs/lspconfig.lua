local map = vim.keymap.set
local buf = vim.lsp.buf

local rust_diagnostic = "bacon"

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		map("n", "gD", buf.declaration, opts)
		map("n", "gd", buf.definition, opts)
		map("n", "K", buf.hover, opts)
		map("n", "gi", buf.implementation, opts)
		map("n", "<C-k>", buf.signature_help, opts)
		map("n", "<space>wa", buf.add_workspace_folder, opts)
		map("n", "<space>wr", buf.remove_workspace_folder, opts)
		map("n", "<space>wl", function()
			print(vim.inspect(buf.list_workspace_folders()))
		end, opts)
		map("n", "<space>D", buf.type_definition, opts)
		map("n", "<space>rn", buf.rename, opts)
		map({ "n", "v" }, "<space>ca", buf.code_action, opts)
		map("n", "gr", buf.references, opts)
	end,
})
