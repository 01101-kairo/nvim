local use = require('packer').use
require('packer').startup(function()
  use ({
    'wbthomason/packer.nvim', -- Package manager
    'lewis6991/impatient.nvim',
    'navarasu/onedark.nvim',
    'shaunsingh/nord.nvim',
    'lukas-reineke/headlines.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'kyazdani42/nvim-web-devicons',
    'p00f/nvim-ts-rainbow',
    'AndrewRadev/tagalong.vim',
    'airblade/vim-gitgutter',
    'dense-analysis/ale',
    'mlaursen/vim-react-snippets',
    -- 'williamboman/mason.nvim',
    -- 'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
  })
  -- use{'turbio/bracey.vim',run = 'npm install --prefix server'}
  use ({'nvim-treesitter/nvim-treesitter',run = ':TSUpdate'})
  use ({'mg979/vim-visual-multi',branch = 'master'})
  use ({'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  })
  use ({'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'kyazdani42/nvim-web-devicons'
  })
  use ({'rrethy/vim-hexokinase',
    run = 'cd ~/.local/share/nvim/site/pack/packer/start/vim-hexokinase && make hexokinase'
  })
  use ({'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  })
  use ({'neoclide/coc.nvim', branch = 'release'})
  use ({'NvChad/nvterm',
    config = function ()
      require("nvterm").setup()
    end,
  })
  use({'iamcco/markdown-preview.nvim',
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  -- use({ 'iamcco/markdown-preview.nvim',
  --   run = "cd app && npm install",
  --   setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
  --   ft = { 'markdown' },
  -- })
end)
