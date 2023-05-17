-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

	-- Colourschemes
	use { "rafi/awesome-vim-colorschemes", opt = true }
	use { "folke/tokyonight.nvim", opt = true }
	use { "maxmx03/FluoroMachine.nvim", opt = true }
	use { "nyoom-engineering/oxocarbon.nvim", opt = true }
	use { "wuelnerdotexe/vim-enfocado", opt = true }
	use { "rose-pine/neovim", as = "rose-pine", opt = true }

	use { "ThePrimeagen/vim-be-good", opt = true }

	use { "norcalli/nvim-colorizer.lua", opt = true }

	use { "akinsho/toggleterm.nvim", opt = true }

	use { "preservim/tagbar", opt = true }
	use { "simrat39/symbols-outline.nvim", opt = true }

	use { "numToStr/Comment.nvim", opt = true }

	use { "mfussenegger/nvim-dap", opt = true }
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, opt = true }
	use { "folke/neodev.nvim", opt = true }
	use { "mfussenegger/nvim-dap-python", opt = true }
	use { "dart-lang/dart-vim-plugin", opt = true }

	use { "neovim/nvim-lspconfig", opt = true }
	use { "hrsh7th/nvim-cmp", opt = true }
	use { "hrsh7th/cmp-nvim-lsp", opt = true }
	use { "hrsh7th/cmp-vsnip", opt = true }
	use { "hrsh7th/cmp-path", opt = true }
	use { "hrsh7th/cmp-buffer", opt = true }
	use { "hrsh7th/vim-vsnip", opt = true }
	use { "simrat39/rust-tools.nvim", opt = true }
	use { "saecki/crates.nvim", requires = "nvim-lua/plenary.nvim", tag = "v0.3.0", opt = true }
	use { "nvim-lua/plenary.nvim", opt = true }
	use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" }, branch = "0.1.x", opt = true }
	use { "LukasPietzschmann/telescope-tabs", requires = { "nvim-telescope/telescope.nvim" }, opt = true }

	use { "nvim-treesitter/nvim-treesitter", opt = true }
	use { "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim", opt = true }

	use { "lukas-reineke/lsp-format.nvim", opt = true } -- Should check this one again
	use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", opt = true }

	use { "anuvyklack/pretty-fold.nvim", opt = true }
	use {
		"anuvyklack/fold-preview.nvim",
		requires = "anuvyklack/keymap-amend.nvim",
		opt = true,
	}

	use { "nvim-treesitter/nvim-treesitter-context", opt = true }

	use { "nvim-lualine/lualine.nvim", opt = true }
	use { "nvim-tree/nvim-web-devicons", opt = true }

	use { "windwp/nvim-autopairs", opt = true }

	use {
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		opt = true,
	}

	use { "tpope/vim-fugitive", opt = true }

	use { "elkowar/yuck.vim", opt = true }
	use { "gpanders/nvim-parinfer", opt = true }

	use {
		"ThePrimeagen/harpoon",
		requires = "nvim-lua/plenary.nvim",
		opt = true,
	}

	use {
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opt = true,
	}

	use { "smjonas/inc-rename.nvim", opt = true }

	use { "stevearc/dressing.nvim", opt = true }

	use {
		"akinsho/bufferline.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		opt = true,
	}

	use {
		"toppair/peek.nvim",
		run = "deno task --quiet build:fast",
		opt = true,
	}

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		opt = true,
	}

	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		opt = true,
	}

	use {
		"cameron-wags/rainbow_csv.nvim",
		config = function()
			require("rainbow_csv").setup()
		end,
		module = {
			"rainbow_csv",
			"rainbow_csv.fns"
		},
		ft = {
			"csv",
			"tsv",
			"csv_semicolon",
			"csv_whitespace",
			"csv_pipe",
			"rfc_csv",
			"rfc_semicolon",
		}
	}

	use {
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup()
		end,
		opt = true,
	}
	use {
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup()
		end,
		requires = "folke/twilight.nvim",
		opt = true,
	}

	use {
		"lewis6991/gitsigns.nvim",
		tag = "release",
		opt = true,
	}
end)
