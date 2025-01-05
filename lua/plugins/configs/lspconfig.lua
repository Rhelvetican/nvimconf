local map = vim.keymap.set
local buf = vim.lsp.buf

local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")

capabilities.textDocument = {
	completion = {
		completionItem = {
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
		},

		dynamicRegistration = true,
	},

	documentHighlight = {
		dynamicRegistration = true,
	},
}

lspconfig.bacon_ls.setup({ capabilities = capabilities })
lspconfig.clangd.setup({ capabilities = capabilities })
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.rust_analyzer.setup({ capabilities = capabilities })
lspconfig.taplo.setup({ capabilities = capabilities })

lspconfig.basedpyright.setup({
	settings = {
		basedpyright = {
			disableOrganizeImports = false,
			disableTaggedHints = false,

			analysis = {
				typeCheckingMode = "standard",
				useLibraryCodeForTypes = true,
				autoImportCompletions = true,
				autoSearchPaths = true,

				inlayHints = {
					genericTypes = true,
				},
			},
		},
	},
	capabilities = capabilities,
})
lspconfig.ruff.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.hoverProvider = false
		on_attach(client, bufnr)
	end,
})
