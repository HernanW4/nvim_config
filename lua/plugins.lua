local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

<<<<<<< HEAD
--C
use 'm-pilia/vim-ccls'
  --StatusLine
=======
  use 'morhetz/gruvbox' --Gruvbox
>>>>>>> develop

  --Lsp 
  use 'neovim/nvim-lspconfig'
  use { "williamboman/mason.nvim" }
  use "williamboman/mason-lspconfig.nvim"

  --LuaDev
  use "folke/lua-dev.nvim"

  --nvim-cmp
   use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  --
  use 'L3MON4D3/LuaSnip'
    use'saadparwaiz1/cmp_luasnip'

--Matching braces
use 'tmsvg/pear-tree'
  -- Nvim-tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

    --TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    --Statusline
    use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

<<<<<<< HEAD

--Devicons
use 'kyazdani42/nvim-web-devicons'
use 'ryanoasis/vim-devicons'
--Autocomplete pairs
use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}

--Tabline
--use { 'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons' }
--use {
--  'romgrk/barbar.nvim',
--  requires = {'kyazdani42/nvim-web-devicons'}
--}
--use 'bagrat/vim-buffet'

-- using packer.nvim
use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

--LSP config
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
--
    

-- Rust config
    --use 'rust-lang/rust.vim'
    use 'alx741/vim-rustfmt'
    use 'simrat39/rust-tools.nvim'
    
    -- Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  --Nvim Tree Sitter
  use 'nvim-treesitter/nvim-treesitter'

-- Color schemes
 use 'sainnhe/sonokai'
  use 'joshdick/onedark.vim'
  use 'tanvirtin/monokai.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { "ellisonleao/gruvbox.nvim" }
use 'folke/lsp-colors.nvim'
use 'eddyekofo94/gruvbox-flat.nvim'

  -- Coc

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

    -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Dashboard (start screen)
  use {
=======
    --alpha-nvim
    use {
>>>>>>> develop
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
}
    -- Rust
    use 'simrat39/rust-tools.nvim'

    --Tabline
use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
}


   if packer_bootstrap then
    require('packer').sync()
  end
end)
