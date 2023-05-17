local nnoremap = require("skizy.keymap").nnoremap
local nmap = require("skizy.keymap").nmap
local tnoremap = require("skizy.keymap").tnoremap

nnoremap("<Leader>e", vim.cmd.Explore)
nnoremap("<Leader>te", vim.cmd.Texplore)

nnoremap("<C-k>", function() vim.o.hlsearch = not vim.o.hlsearch end)

nmap("<F7>", "<cmd>SymbolsOutline<cr>")
-- nmap("<F7>", function() require("telescope.builtin").lsp_document_symbols({
-- 	ignore_symbols = {
-- 		"enummember",
-- 		"field",
-- 	}
-- }) end)

nmap("<F2>", require("dap").toggle_breakpoint)
nmap("<F3>", require("dap").continue)
nmap("<F4>", require("dap").step_over)
nmap("<F5>", require("dap").step_into)

nnoremap("<Leader>fh", function() require('telescope.builtin').find_files({ cwd="/home/skizy/", hidden=true }) end)
nnoremap("<Leader>fd", function() require('telescope.builtin').find_files({ cwd="/home/skizy/" }) end)
nnoremap("<Leader>fc", function() require('telescope.builtin').find_files({ cwd="/home/skizy/.config/", hidden=true }) end)
nnoremap("<Leader>ff", function() require('telescope.builtin').find_files({ hidden=true }) end)
nnoremap("<Leader>lg", require('telescope.builtin').live_grep)
nnoremap("<Leader>b", require("telescope.builtin").buffers)
nnoremap("<Leader>ts", require("telescope-tabs").list_tabs)

nnoremap("<Leader>sp", function() require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({
	layout_config = { width = 40, height = 15, },
})) end)

nnoremap("<Leader>td", require("telescope.builtin").diagnostics)
nnoremap("<Leader>vd", vim.diagnostic.open_float)
nnoremap("<Leader>nd", vim.diagnostic.goto_next)
nnoremap("<Leader>vk", vim.lsp.buf.hover)
nnoremap("<Leader>a", vim.lsp.buf.code_action)
nnoremap("<Leader>rn", vim.lsp.buf.rename)
nnoremap("<Leader>gd", function() vim.lsp.buf.definition({ reuse_win = true }) end)
nnoremap("<Leader>fm", function() vim.lsp.buf.format({ async = true }) end)

nnoremap("<Leader>gg", "<C-6>")

nnoremap("<Leader>tn", vim.cmd.tabnew)
nnoremap("<Leader>tt", function()
	vim.cmd("tabe term://$SHELL")
	vim.cmd("startinsert")
end)

nnoremap("<Leader>w", vim.cmd.w)
nnoremap("<Leader>q", vim.cmd.bd)

nnoremap("<A-h>", vim.cmd.bp)
nnoremap("<A-l>", vim.cmd.bn)
tnoremap("<A-n>", "<C-\\><C-N>")

local crates = require("crates")
local opts = { silent = true }

nnoremap("<Leader>cr", crates.reload, opts)

nnoremap("<Leader>cv", crates.show_versions_popup, opts)
nnoremap("<Leader>cf", crates.show_features_popup, opts)
nnoremap("<Leader>cd", crates.show_dependencies_popup, opts)

nnoremap("<Leader>cu", crates.update_crate, opts)
nnoremap("<Leader>cu", crates.update_crates, opts)
nnoremap("<Leader>ca", crates.update_all_crates, opts)
nnoremap("<Leader>cU", crates.upgrade_crate, opts)
nnoremap("<Leader>cU", crates.upgrade_crates, opts)
nnoremap("<Leader>cA", crates.upgrade_all_crates, opts)

nnoremap("<Leader>cH", crates.open_homepage, opts)
nnoremap("<Leader>cR", crates.open_repository, opts)
nnoremap("<Leader>cD", crates.open_documentation, opts)
nnoremap("<Leader>cC", crates.open_crates_io, opts)

nnoremap("<Leader>rf", "<cmd>TroubleToggle lsp_references<cr>")
