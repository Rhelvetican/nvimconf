local oldschool = function(opts)
	return "Being oldschool in " .. opts.filename
end

local languages = {
	["c"] = oldschool,
	["cpp"] = oldschool,
	["h"] = oldschool,
	["hpp"] = oldschool,
	["objc"] = oldschool,
	["objcpp"] = oldschool,

	["rust"] = function(opts)
		return "Oxidizing " .. opts.filename
	end,

	["lua"] = function(opts)
		return "Writing cool lua code at " .. opts.filename
	end,

	["zig"] = function(opts)
		return "Zigging at " .. opts.filename
	end,

	["python"] = function(opts)
		return "Slithering around at " .. opts.filename
	end,
}

require("cord").setup({
	editor = {
		client = "neovim",
		tooltip = "The Supreme Text Editor",
	},

	text = {
		editing = function(opts)
			local handle = languages[opts.filetype]
			if handle then
				return handle(opts)
			else
				return "Editing " .. name
			end
		end,

		diagnostics = function(opts)
			return "Fixing like, "
				.. vim.diagnostic.count(0, { severity = { min = vim.diagnostic.severity.WARN } })
				.. " bugs."
		end,

		docs = "Reading docs...",
		vcs = "Managing git...",
	},

	assets = {
		["Cargo.toml"] = {
			text = "Managing Cargo dependencies...",
		},

		["pyproject.toml"] = {
			text = "Managing Python project...",
		},
	},
})
