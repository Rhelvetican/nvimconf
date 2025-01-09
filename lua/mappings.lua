local map = vim.keymap.set

vim.g.mapleader = ","

-- general mappings
map({ "n", "v", "o" }, "<C-s>", "<cmd> w <CR>")
map("n", "g?", "<cmd>lua vim.diagnostic.open_float()<CR>")
map({ "n", "v", "o" }, "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent
map({ "n", "v", "o" }, "<leader>ya", "<cmd> %y+ <CR>")
map({ "n", "v", "o" }, "<leader>da", "<cmd> %d+ <CR>")
map({ "n", "v", "o" }, "tb", "<cmd>tab term<CR>")

-- telescope
map("n", "tff", "<cmd> Tele find_files <CR>")
map("n", "tfo", "<cmd> Tele oldfiles <CR>")
map("n", "tfw", "<cmd> Tele live_grep <CR>")
map("n", "tgt", "<cmd> Tele git_status <CR>")

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")

-- comment.nvim
map("n", "cmt", "gcc", { remap = true })
map("v", "ct", "gc", { remap = true })

-- format
map("n", "fm", function()
	require("plugins.configs.conform").format()
end)

-- mason
map("n", ".ms", "<cmd> Mason <CR>")

-- oil.nvim
map("n", "<C-o>", "<cmd> Oil <CR>")
map("n", "<C-O>", "<cmd> Oil --float <CR>")

-- lazy.nvim
map("n", "<C-l>", "<cmd> Lazy <CR>")
