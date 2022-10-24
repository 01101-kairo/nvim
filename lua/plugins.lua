local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'lewis6991/impatient.nvim'
  use 'navarasu/onedark.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'p00f/nvim-ts-rainbow'
  use 'neovim/nvim-lspconfig'
  use 'AndrewRadev/tagalong.vim'
  use 'dense-analysis/ale'
  use 'airblade/vim-gitgutter'
  -- use{'turbio/bracey.vim',run = 'npm install --prefix server'}
  use {'nvim-treesitter/nvim-treesitter',run = ':TSUpdate'}
  use {'mg979/vim-visual-multi',branch = 'master'}
  use {'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
  use {'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {'rrethy/vim-hexokinase',
    run = 'cd ~/.local/share/nvim/site/pack/packer/start/vim-hexokinase && make hexokinase'
  }
  use {'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'NvChad/nvterm',
    config = function ()
      require("nvterm").setup()
    end,
  }
  use({'iamcco/markdown-preview.nvim',
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use({ 'iamcco/markdown-preview.nvim',
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    ft = { 'markdown' },
  })
end)
