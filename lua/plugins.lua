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

use 'kamykn/popup-menu.nvim'

-- Mark down
-- install without yarn or npm

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

--Color theme
use 'Mofiqul/dracula.nvim'
use 'EdenEast/nightfox.nvim' -- Packer
use 'morhetz/gruvbox'
use 'joshdick/onedark.vim'
use 'sainnhe/sonokai'

--Status Line
--
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

use 'nvim-tree/nvim-web-devicons'

--Tabline
use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
}

--Transparent
use 'xiyaowong/nvim-transparent'

--Nvim-tree
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}


--NvimCmp and LuaSnip
--
use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'

use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'

--Lsp Stuff
use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
}

--Rust
use 'simrat39/rust-tools.nvim'
   if packer_bootstrap then
    require('packer').sync()
  end
end)
