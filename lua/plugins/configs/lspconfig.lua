-- Use LspAttach autocommand to only map the following keys
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client == nil then
			return
		end

		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

capabilities.textDocument.semanticTokens = {
	dynamicRegistration = true,
	augmentsSyntaxTokens = true,
	multilineTokenSupport = true,
}

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

lspconfig.ruff.setup({})

lspconfig.basedpyright.setup({
	settings = {
		basedpyright = {
			disableOrganizeImports = true,
			typeCheckingMode = "off",
		},
		python = {
			analysis = {
				ignore = { "*" },
			},
		},
	},
})

lspconfig.taplo.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

lspconfig.nushell.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

lspconfig.clangd.setup({
	capabilities = capabilities,
	on_attach = function(client, buffer)
		-- On attach
	end,

	filetypes = { "c", "cc", "h", "cpp", "hpp", "objc", "objcpp" },
	cmd = { "clangd", "--background-index" },
	root_dir = lspconfig.util.root_pattern(
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git"
	),
})

lspconfig.zls.setup({
	capabilities = capabilities,
})
