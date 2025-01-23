local capabilities = vim.lsp.protocol.make_client_capabilities()

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

local M = {}
local servers = {}

servers.clangd = {
	capabilities = capabilities,
}

servers.taplo = {
	capabilities = capabilities,
}

servers.lua_ls = {
	capabilities = capabilities,
}

servers.harper_ls = {
	capabilities = capabilities,
}

servers.basedpyright = {
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
}

servers.ruff = {
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
}

M.servers = servers

return M
