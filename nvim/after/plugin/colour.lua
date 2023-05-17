require("tokyonight").setup({
	transparent = true,
	style = "night",
	styles = {
		sidebars = "transparent",
	},
})

require("fluoromachine").setup({
	config = {
		transparent = true,
		-- brightness = 0.15,
		glow = false,
	}
})

-- (1) Underline instead of undercurl for diagnostics
-- local groups = {
-- 	error = 'love',
-- 	hint = 'iris',
-- 	info = 'foam',
-- 	warn = 'gold',
-- }

require("rose-pine").setup({
	variant = "moon",
	dark_variant = "moon",
	disable_background = true,
	-- disable_float_background = true,
	groups = {
		background = "none",
	},
	highlight_groups = {
		TelescopeTitle = { fg = "rose" },
		TelescopeBorder = { fg = "foam", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "none" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "none" },
		TelescopeSelectionCaret = { fg = "rose", bg = "none" },

		-- (2) Underline instead of undercurl for diagnostics
		-- DiagnosticUnderlineError = { sp = groups.error, underline = true },
		-- DiagnosticUnderlineHint = { sp = groups.hint, underline = true },
		-- DiagnosticUnderlineInfo = { sp = groups.info, underline = true },
		-- DiagnosticUnderlineWarn = { sp = groups.warn, underline = true },

		-- GitSignsDeleteNr = { bg = "none" },
		-- GitSignsDelete = { bg = "none" },
		-- GitSignsChangeNr = { bg = "none" },
		-- GitSignsChange = { bg = "none" },
		-- GitSignsAddNr = { bg = "none" },
		-- GitSignsAdd = { bg = "none" },
	},
})

vim.opt.background = "dark"

vim.cmd("colorscheme rose-pine")
-- vim.cmd.colorscheme("tokyonight")

-- vim.g.enfocado_style = "neon"
-- vim.cmd("colorscheme enfocado")

-- vim.cmd("hi Normal guibg=NONE")
-- vim.cmd("hi Normal ctermbg=NONE")
-- vim.cmd("hi LineNr guibg=NONE")
-- vim.cmd("hi LineNr ctermbg=NONE")
-- vim.cmd("hi MsgArea guibg=NONE")
