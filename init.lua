local function OpenDiagnostics()
    vim.lsp.diagnostic.set_loclist()
end

require('plugins')

require('core/keymaps')
require('core/reload')
require('core/colorscheme')
require('core/options')
require('core/rust')
require('core/statusline')
require('core/tabline')


require('plugins_config/nvim-treesitter')
require('plugins_config/nvim-tree')
require('plugins_config/alpha-nvim')
require('lsp_config/lsp_setup')
require('lsp_config/nvim_cmp')


