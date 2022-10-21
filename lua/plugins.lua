local use = require('packer').use
require('packer').startup(function()

  use 'wbthomason/packer.nvim' -- Package manager

  use 'lewis6991/impatient.nvim'
  use 'navarasu/onedark.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true }
  }
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-colorizer.lua'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate' }
  use{
    'neovim/nvim-lspconfig',
    opt = true,setup = function()
      require('core.lazy_load').on_file_open 'nvim-lspconfig'
    end,
    config = function()
      require 'plugins.configs.lspconfig'
    end
  }

  use {
    'mg979/vim-visual-multi',
    branch = 'master'
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }
  use 'AndrewRadev/tagalong.vim'

  -- live-server
  use{
    'turbio/bracey.vim',
    run = 'npm install --prefix server',
  }
  use 'dense-analysis/ale'

  -- install without yarn or npm
  -- use{
  --   'iamcco/markdown-preview.nvim',
  --   run = function() vim.fn['mkdp#util#install']() end,
  -- }

  use{
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    ft = { 'markdown' },
  }
end)
