local map = vim.keymap.set

local cfg = require("rustaceanvim.config")

vim.g.rustaceanvim = function()
	local registry = require("mason-registry")

	local codelldb = registry.get_package("codelldb"):get_install_path()
	local ext_path = codelldb .. "/extension/"
	local codelldb_path = ext_path .. "adapter/codelldb"
	local liblldb_path = ext_path .. "lldb/lib/liblldb.dylib"

	return {
		dap = {
			adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
		},
	}
end

local function map_rustlsp(keymap, command)
	map({ "n", "v", "o" }, keymap, "<cmd>RustLsp " .. command .. "<CR>")
end

local function map_rustlsp_b(keymap, command)
	map({ "n", "v", "o" }, keymap, "<cmd>RustLsp! " .. command .. "<CR>")
end

map_rustlsp("<C-.>ee", "explainError")
map_rustlsp("<C-.>em", "expandMacro")
map_rustlsp("<C-.>oc", "openCargo")
map_rustlsp("<C-.>od", "openDocs")
map_rustlsp("<C-.>pm", "parentModule")
map_rustlsp("<C-.>bm", "rebuildProcMacros")
map_rustlsp("<C-.>m<Up>", "moveItem up")
map_rustlsp("<C-.>m<Down>", "moveItem down")
map_rustlsp("<C-.>st", "syntaxTree")

map_rustlsp("<C-.>db", "debuggables")
map_rustlsp_b("<C-.>db!", "debuggables")
map_rustlsp("<C-.>rr", "runnables")
map_rustlsp_b("<C-.>rr!", "debuggables")
