vim.opt.shell = '/bin/bash'

require('core/keymaps')
require('core/reload')
require('core/statusline')
require('core/options')
require('core/colorscheme')
require('core/rust')


require('tree/treesitter')
require('tree/nvim-tree')


require('lsp_config.lsp_setup')
require('lsp_config/nvim_cmp')


require('plugins')
