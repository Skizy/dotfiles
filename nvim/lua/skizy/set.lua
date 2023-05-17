vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.cindent = true
-- vim.bo.cinoptions = ">s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,N0,E0,ps,ts,is,+s,c3,C0,/0,(0,us,U0,w0,Ws,k0,m1,M0,j0,J0,)20,*70,#0,P0"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = ""
vim.opt.wrap = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.hls = false
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldmethod = "marker"
vim.opt.showmode = false
vim.opt.signcolumn = "auto:2"

vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_bufsettings="noma nomod nu nobl nowrap ro rnu"
vim.g.netrw_list_hide = "^\\.\\./$,^\\./$"
-- vim.g.flutter_autoscroll = 1
vim.g.lightline = {
	colorscheme = "moonrosepine",

	separator = { left = '', right = '' },
	subseparator = { left = '', right = '' },

	active = {
		left = { { "mode", "paste" }, { "gitbranch", "readonly", "filename", "modified" } },
	},
	component_function = {
		gitbranch = "FugitiveHead",
	}
}
vim.g.termguicolors = true
-- vim.b.cinwords = "if,else,while,do,for,switch,(,["

-- vim.o.completeopt = "menuone,noselect"
-- vim.o.shortmess = vim.o.shortmess .. "c"
vim.g.dart_style_guide = 2
-- vim.g.dart_format_on_save = 1
vim.g.mapleader = ' '
vim.g.delimitMate_expand_cr = 1

vim.g.rust_use_custom_ctags_defs = 1
vim.g.tagbar_type_rust = {
  ctagsbin = '/usr/bin/ctags-universal',
  ctagstype = 'rust',
  kinds = {
    'n:modules',
    's:structures:1',
    'i:interfaces',
    'c:implementations',
    'f:functions:1',
    'g:enumerations:1',
    't:type aliases:1:0',
    'C:constants:1:0',
    'M:macros:1',
    'm:fields:1:0',
    'e:enum variants:1:0',
    'P:methods:1',
  },
  sro = '::',
  kind2scope = {
    n = 'module',
    s = 'struct',
    i = 'interface',
    c = 'implementation',
    f = 'function',
    g = 'enum',
    t = 'typedef',
    v = 'variable',
    M = 'macro',
    m = 'field',
    e = 'enumerator',
    P = 'method',
  },
}

vim.g.tagbar_show_linenumbers = -1

-- vim.g.gutentags_file_list_command = "rg --files"
-- vim.g.gutentags_ctags_executable = "ctags-universal"
-- vim.g.gutentags_ctags_extra_args = {"--kinds-rust=-em"}

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
