local dialmap = require("dial.map")
local map = vim.keymap.set

map("n", "<C-a>", function()
	dialmap.manipulate("increment", "normal")
end)

map("n", "<C-x>", function()
	dialmap.manipulate("decrement", "normal")
end)

map("n", "g<C-a>", function()
	dialmap.manipulate("increment", "gnormal")
end)

map("n", "g<C-x>", function()
	dialmap.manipulate("decrement", "gnormal")
end)

map("v", "<C-a>", function()
	dialmap.manipulate("increment", "visual")
end)

map("v", "<C-x>", function()
	dialmap.manipulate("decrement", "visual")
end)

map("v", "g<C-a>", function()
	dialmap.manipulate("increment", "gvisual")
end)

map("v", "g<C-x>", function()
	dialmap.manipulate("decrement", "gvisual")
end)
