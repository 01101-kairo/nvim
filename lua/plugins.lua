local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  use 'lewis6991/impatient.nvim'
  use 'navarasu/onedark.nvim'
  use 'lukas-reineke/headlines.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'p00f/nvim-ts-rainbow'
  use 'AndrewRadev/tagalong.vim'
  use 'airblade/vim-gitgutter'
  use 'mlaursen/vim-react-snippets'
  use 'neovim/nvim-lspconfig'

  use ({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  })

  use ({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })

  use ({
    'mg979/vim-visual-multi',
    branch = 'master'
  })

  use ({
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup {}
    end
  })

  use ({
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  })

  use ({
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'kyazdani42/nvim-web-devicons'
  })

  use ({
    'rrethy/vim-hexokinase',
    run = 'cd ~/.local/share/nvim/site/pack/packer/start/vim-hexokinase && make hexokinase'
  })

  use ({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  })

  use ({
    'neoclide/coc.nvim',
    branch = 'release'
  })

  use ({
    'NvChad/nvterm',
    config = function ()
      require("nvterm").setup()
    end,
  })

  use({
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })

end)
