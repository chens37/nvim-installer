return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'EdenEast/nightfox.nvim'

  -- nvim-tree
  use {
      'nvim-tree/nvim-tree.lua',
       requires = 'nvim-tree/nvim-web-devicons'
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'goolord/alpha-nvim', 
  }

  -- tags
  use {
    'ludovicchabant/vim-gutentags', 'skywind3000/gutentags_plus'
    --'jsfaint/gen_tags.vim'
  }
  -- lspconfig
  use {
  --  'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer', 'p00f/clangd_extensions.nvim' 
  }

  -- complete
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  --  'hrsh7th/cmp-nvim-lsp',
  --  'rafamadriz/friendly-snippets',
  --  'onsails/lspkind-nvim'
  }

  -- term
  use {
    -- 'voldikss/vim-floaterm'
    "akinsho/toggleterm.nvim", tag = '*',
  }

  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
  }

  use {
    'ggandor/leap.nvim',
  }

end)
