require("cord").setup({
	editor = {
		client = "neovim",
		tooltip = "The Supreme Text Editor",
	},

	text = {
		editing = function(opts)
			local type, name = opts.filetype, opts.filename

			local oldschool = function()
				return "Being oldschool in " .. name
			end

			local languages = {
				["c"] = oldschool,
				["cpp"] = oldschool,
				["h"] = oldschool,
				["hpp"] = oldschool,
				["objc"] = oldschool,
				["objcpp"] = oldschool,
			}

			languages["rust"] = function()
				return "Oxidizing " .. name
			end

			languages["lua"] = function()
				return "Writing cool lua code at " .. name
			end

			languages["zig"] = function()
				return "Writing Zig at " .. name
			end

			local handle = languages[type]

			if handle then
				return handle()
			else
				return "Editing " .. name
			end
		end,

		docs = "Reading docs...",
		vcs = "Managing git...",
	},

	assets = {
		["Cargo.toml"] = {
			text = "Managing Cargo dependencies...",
		},
	},
})
