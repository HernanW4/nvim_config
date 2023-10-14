local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
    --Lsp config
  use 'VonHeikemen/lsp-zero.nvim'
    -- LSP Support
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lua'

  use 'hrsh7th/cmp-cmdline'

    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    use 'onsails/lspkind-nvim'
    use 'nvim-tree/nvim-web-devicons'

    use  { "catppuccin/nvim", as = "catppuccin" }

      --UndoTree
use "mbbill/undotree"

  --Treesitter
      use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    --Telescope
    --To navigate to directories much easier
    use {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
    use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use 'jvgrootveld/telescope-zoxide'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    --Tree
  use 'nvim-tree/nvim-tree.lua'


    --Lualine
  use 'nvim-lualine/lualine.nvim'


  --Tmux
 use({
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
}) 

use 'arkav/lualine-lsp-progress'

    use 'ThePrimeagen/harpoon'


  if packer_bootstrap then
    require('packer').sync()
  end
end)
