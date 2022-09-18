local nnoremap = require("skizy.keymap").nnoremap
local nmap = require("skizy.keymap").nmap

nnoremap("<C-t>", "<cmd>Explore<CR>")
nnoremap("<C-k>", "<cmd>noh<CR>")
nnoremap("<C-l>", "<cmd>call CocActionAsync('jumpDefinition')<CR>")
nmap("<F7>", "<cmd>TagbarToggle<CR>")

require('toggleterm').setup{open_mapping=[[<C-s>]]}

vim.api.nvim_set_keymap("i", "<TAB>", "pumvisible() ? coc#pum#next(1) : '<TAB>'", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "pumvisible() ? coc#pum#prev(1) : '<C-h>'", {noremap = true, expr = true})
