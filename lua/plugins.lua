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
	use 'wbthomason/packer.nvim'

    --LSP 
    use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
}

    --Tree 
    use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

    --TreeSitter
    use 'nvim-treesitter/nvim-treesitter'

    --rust
    use 'simrat39/rust-tools.nvim'

    --nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    
    use 'L3MON4D3/LuaSnip'
 use'saadparwaiz1/cmp_luasnip'

	--StatusLine
	use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
    

  --Colorscheme
  use { "ellisonleao/gruvbox.nvim" }

if packer_bootstrap then
    require('packer').sync()
  end
end)

