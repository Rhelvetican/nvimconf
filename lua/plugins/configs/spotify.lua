local spotify = require("spotify")

local content = require("io").read("spotify.txt", "*l")

if content then
else
	local cache, err = require("io").open("spotify.txt", "w")

	if err then
		return
	end

	vim.ui.input({ prompt = "Enter your Spotify API token:" }, function(token)
		if token ~= nil then
			local f, err = cache.write(token)
		end
	end)

	cache.write("rt")
end
