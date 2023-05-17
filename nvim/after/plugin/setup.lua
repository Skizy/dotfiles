require("lspconfig.ui.windows").default_options = {
	border = "rounded",
}

require("lualine").setup({
	options = {
		refresh = {
			statusline = 500,
		},
	},
	sections = {
		lualine_x = {
			{
				require("noice").api.statusline.mode.get,
				cond = require("noice").api.statusline.mode.has,
			},
			"encoding",
			"fileformat",
			"filetype",
		},
	},
})

require("pretty-fold").setup({
	fill_char = '-',
})

require("fold-preview").setup()

require("nvim-autopairs").setup({
	map_bs = false,
})

require("startup").setup() -- Start screen

require("toggleterm").setup({
	open_mapping = "<C-s>",
	direction = "float",
	float_opts = {
		border = "curved",
	}
})

require("harpoon").setup()

require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		-- signature = {
		-- 	auto_open = {
		-- 		enabled = false,
		-- 	},
		-- },
	},
	presets = {
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false,     -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true,  -- add a border to hover docs and signature help
	},
})

require("notify").setup({
	background_colour = "#000000",
})
vim.notify = require("notify")

require("inc_rename").setup()

require("dressing").setup({
	select = {
		telescope = require("telescope.themes").get_cursor()
	}
})

require("bufferline").setup()

require("Comment").setup()

require("colorizer").setup()

require("peek").setup({
	app = "browser",
})

require("symbols-outline").setup({
	auto_close = true,
	show_relative_numbers = true,
	autofold_depth = 1,
	width = 40,
})

require("todo-comments").setup()

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = { "rust", "lua", "markdown" }
	}
})

require("crates").setup()

require("trouble").setup()

require("nvim-web-devicons").setup({
	override = {
		txt = {
			color = "#89e051",
			cterm_color = "113",
			icon = "",
			name = "Txt"
		},
	},
})

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map('n', "]c", function()
			if vim.wo.diff then return "]c" end
			vim.schedule(function() gs.next_hunk() end)
			return "<Ignore>"
		end, { expr = true })
		map('n', "[c", function()
			if vim.wo.diff then return "[c" end
			vim.schedule(function() gs.prev_hunk() end)
			return "<Ignore>"
		end, { expr = true })
	end,
})
