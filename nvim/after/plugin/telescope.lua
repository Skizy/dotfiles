require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim" -- add this value
		},
	},
	-- pickers = {
	-- 	find_files = {
	-- 		mappings = {
	-- 			i = {
	-- 				["<cr>"] = function(bufnr)
	-- 					require("telescope.actions.set").edit(bufnr, "tab drop")
	-- 				end
	-- 			},
	-- 		},
	-- 	},
	-- 	live_grep = {
	-- 		mappings = {
	-- 			i = {
	-- 				["<cr>"] = function(bufnr)
	-- 					require("telescope.actions.set").edit(bufnr, "tab drop")
	-- 				end
	-- 			},
	-- 		},
	-- 	},
	-- 	diagnostics = {
	-- 		mappings = {
	-- 			i = {
	-- 				["<cr>"] = function(bufnr)
	-- 					require("telescope.actions.set").edit(bufnr, "tab drop")
	-- 				end
	-- 			},
	-- 		},
	-- 	},
	-- },
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		},
	},
})

require("telescope").load_extension("fzf")
