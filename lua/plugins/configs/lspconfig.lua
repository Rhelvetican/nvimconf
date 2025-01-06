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
			snippetSupport = true,
			preselectSupport = true,
			insertReplaceSupport = true,
			labelDetailsSupport = true,
			deprecatedSupport = true,
			commitCharactersSupport = true,
		},

		dynamicRegistration = true,
	},

	documentHighlight = {
		dynamicRegistration = true,
	},
}

lspconfig.bacon_ls.setup({})
lspconfig.clangd.setup({})
lspconfig.taplo.setup({})
lspconfig.lua_ls.setup({})
lspconfig.harper_ls.setup({})

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
