vim.opt.shell = '/bin/bash'

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

  --Lightline
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

--Autocomplete pairs
use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}

--Tabline
use({
    'crispgm/nvim-tabline',
    config = function()
        require('tabline').setup({})
    end,
})

--use { 'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons' }


--LSP config
--
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    

-- Rust fmt
    --use 'rust-lang/rust.vim'
    use 'alx741/vim-rustfmt'

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  --Nvim Tree Sitter
  use 'nvim-treesitter/nvim-treesitter'

-- Color schemes
  use 'joshdick/onedark.vim'
  use 'tanvirtin/monokai.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { "ellisonleao/gruvbox.nvim" }


  -- Coc
  use {'neoclide/coc.nvim', branch = 'release'}

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
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }


   if packer_bootstrap then
    require('packer').sync()
  end
end)
