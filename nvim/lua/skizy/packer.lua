-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'ap/vim-css-color'
	use 'ryanoasis/vim-devicons'
	use 'akinsho/toggleterm.nvim'
	use 'preservim/tagbar'
	use 'neoclide/coc.nvim'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'Raimondi/delimitMate'
	use 'mfussenegger/nvim-dap'
	use 'mfussenegger/nvim-dap-python'
	use 'mg979/vim-visual-multi'
	use 'dart-lang/dart-vim-plugin'
	use 'thosakwe/vim-flutter'
end)
