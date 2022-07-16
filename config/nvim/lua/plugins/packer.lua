local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Theme
	use 'Shatur/neovim-ayu'
	-- Tree directory
	use {
  		'kyazdani42/nvim-tree.lua',
		requires = {
    		'kyazdani42/nvim-web-devicons', -- optional, for file icons
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim'
  		},
  	tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	-- Feline, barra inferior
	use {
		'feline-nvim/feline.nvim',
		require = {
			'gitsigns.nvim',
			'nvim-web-devicons',
		}
	}

	-- Autocompletado
	use {'neoclide/coc.nvim', branch= 'release'}
	-- Cierre automatico de llaves y parentesis
	use {
		"windwp/nvim-autopairs",
    	config = function() 
			require("nvim-autopairs").setup()
		end
	}
	use 'SmiteshP/nvim-gps'
	-- Resaltado de sitaxis
  	use 'nvim-treesitter/nvim-treesitter'
  	use 'p00f/nvim-ts-rainbow'
	-- Integracion con git
	use {
 		'lewis6991/gitsigns.nvim',
  		-- tag = 'release' -- To use the latest release
	}
	-- Busqueda de archivos
	use {
  		'nvim-telescope/telescope.nvim',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- identificador de errores
	use {
  		"folke/trouble.nvim",
  		requires = "kyazdani42/nvim-web-devicons",
	}
	-- terminal
	use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
  		require("toggleterm").setup()
	end}
	-- debugger
	use {
		'puremourning/vimspector'
	}
end)
