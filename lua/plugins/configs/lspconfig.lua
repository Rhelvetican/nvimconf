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

lspconfig.clangd.setup({})
lspconfig.taplo.setup({})
lspconfig.lua_ls.setup({})
lspconfig.harper_ls.setup({
	filetypes = {
		"c",
		"cpp",
		"cs",
		"gitcommit",
		"go",
		"html",
		"java",
		"javascript",
		"lua",
		"markdown",
		"nix",
		"python",
		"ruby",
		"rust",
		"swift",
		"toml",
		"typescript",
		"typescriptreact",
		"haskell",
		"cmake",
		"text",
	},
})

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
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
})
