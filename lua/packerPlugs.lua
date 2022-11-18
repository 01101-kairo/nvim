--| Plugins |===================================================================
----------------------------------------------------------- Settings Neovim Lua
local use = require('packer').use

require('packer').startup(function()
  use ({
    -- Package manager
    'wbthomason/packer.nvim',
    -- Performace
    'lewis6991/impatient.nvim',
    -- Aparencia
    'navarasu/onedark.nvim',
    'Mofiqul/dracula.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'p00f/nvim-ts-rainbow',
    'kyazdani42/nvim-web-devicons',
    { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons',opt = true}},
    { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'kyazdani42/nvim-web-devicons'},
    { 'rrethy/vim-hexokinase', run = 'cd ~/.local/share/nvim/site/pack/packer/start/vim-hexokinase && make hexokinase'},
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
    -- Utilitarios
    'steelsojka/pears.nvim',
    'AndrewRadev/tagalong.vim',
    'airblade/vim-gitgutter',
    { 'mg979/vim-visual-multi', branch = 'master'},
    { 'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons',}, tag = 'nightly'},
    { 'numToStr/Comment.nvim', config = function()require('Comment').setup()end},
    { 'akinsho/toggleterm.nvim', tag = 'v2.*'},
    { 'iamcco/markdown-preview.nvim', run = function()vim.fn["mkdp#util#install"]()end,},
    -- LSP
    'williamboman/mason.nvim',
    'williamboman/nvim-lsp-installer',
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',
    'mfussenegger/nvim-dap',
    'rafamadriz/friendly-snippets',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'honza/vim-snippets',
    'mlaursen/vim-react-snippets',
    'puremourning/vimspector',
    'mfussenegger/nvim-jdtls',
    'artur-shaik/jc.nvim',
  })
end)
