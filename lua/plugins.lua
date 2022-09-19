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

  use 'morhetz/gruvbox' --Gruvbox

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

  -- Nvim-tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)

}
    --Statusline
    use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
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
