local nvim_lsp = require("lspconfig")

local cmp = require("cmp")
cmp.setup({
	-- Enable LSP snippets
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		-- Add tab support
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = false,
		})
	},

	-- Installed sources
	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "crates" },
	},

	preselect = cmp.PreselectMode.None

})

local my_capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("nvim-treesitter.configs").setup {
	ensure_installed = { "rust", "lua", "python", "help", "query" }
}

require("treesitter-context").setup({
	enable = true,         -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0,         -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
	trim_scope = "outer",  -- Which context lines to discard if `max_lines` is exceeded. Choices: "inner", "outer"
	mode = "cursor",       -- Line used to calculate context. Choices: "cursor", "topline"
	-- Separator between context and content. Should be a single character string, like "-".
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
})


-- RUST
local opts = {
	tools = {
		-- rust-tools options
		autoSetHints = true,
		-- hover_with_actions = true,
		inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
	server = {
		-- on_attach is a callback called when the language server attachs to the buffer
		-- on_attach = on_attach,
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
				check = {
					command = "clippy"
				},
				signatureInfo = {
					-- detail = "parameters", -- by default shows "full" signature
					documentation = {
						enable = false,
					},
				},
			}
		}
	},
}
require("rust-tools").setup(opts)
-- END OF RUST

require("lsp-format").setup({})
require("flutter-tools").setup({
	lsp = {
		capabilities = my_capabilities,
		on_attach = require("lsp-format").on_attach
	}
})

nvim_lsp.pyright.setup({})
-- require("lspconfig").pylsp.setup{
-- 	settings = {
-- 		pylsp = {
-- 			plugins = {
-- 				pycodestyle = {
-- 					ignore = {"W391", "E262", "W503", "W504", "E501"},
-- 					maxLineLength = 100
-- 				},
-- 				mccabe = {
-- 					threshold = 100
-- 				}
-- 			}
-- 		}
-- 	}
-- }

require("neodev").setup({
	library = { plugins = { "nvim-dap-ui" }, types = true },
})

nvim_lsp.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- diagnostics = {
			-- 	-- Get the language server to recognize the `vim` global
			-- 	globals = {"vim"},
			-- },
			-- workspace = {
			-- 	-- Make the server aware of Neovim runtime files
			-- 	library = vim.api.nvim_get_runtime_file("", true),
			-- },
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dap.set_log_level("TRACE")
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode-14",
	name = "lldb"
}
dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
}

-- local on_attach = function(client, bufnr)
-- 	-- Enable completion triggered by <c-x><c-o>
-- 	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

-- 	-- Mappings.
-- 	-- See `:help vim.lsp.*` for documentation on any of the below functions
-- 	local bufopts = { noremap=true, silent=true, buffer=bufnr }
-- 	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
-- 	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
-- 	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
-- 	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
-- 	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
-- 	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
-- 	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
-- 	vim.keymap.set("n", "<space>wl", function()
-- 		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 	end, bufopts)
-- 	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
-- 	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
-- 	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
-- 	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
-- 	vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
-- end
-- require("lspconfig")["pyright"].setup{
-- 	on_attach = on_attach,
-- 	flags = {debounce_text_changes = 150}
-- }

vim.diagnostic.config({ underline = true })
