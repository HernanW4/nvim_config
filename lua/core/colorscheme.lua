-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- See: https://github.com/brainfucksec/neovim-lua#appearance

-- Load nvim color scheme:
-- Change the "require" values with your color scheme
-- Available color schemes: onedark, monokai, rose-pine

--vim.opt.background = 'dark'
--vim.cmd([[colorscheme gruvbox]])


vim.opt.termguicolors = true
-- Note: The instruction to load the color scheme may vary.
-- See the README of the selected color scheme for the instruction
-- to use.
-- e.g.: require('color_scheme').setup{}, vim.cmd('color_scheme')

-- OneDark styles: dark, darker, cool, deep, warm, warmer, light
--require('onedark').setup {
--  style = 'darker',
--  colors = { fg = '#b2bbcc' }, --default: #a0a8b7
--}
--require('onedark').load()

-- Lua
require("lsp-colors").setup({
  Error = "#FF0000",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
vim.g.sonokai_diagnostic_virtual_text ='colored'
vim.cmd([[colorscheme sonokai]])


--CoC Message Highlight


-- statusline color schemes:
-- import with: require('colors').colorscheme_name
--local M = {}

-- Theme: OneDark (dark)
-- Colors: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
--M.onedark_dark = {
--  bg = '#282c34',
--  fg = '#b2bbcc',
--  pink = '#c678dd',
--  green = '#98c379',
--  cyan = '#56b6c2',
--  yellow = '#e5c07b',
--  orange = '#d19a66',
--  red = '#e86671',
--}
--
---- Theme: Monokai (classic)
---- Colors: https://github.com/tanvirtin/monokai.nvim/blob/master/lua/monokai.lua
--M.monokai = {
--  bg = '#202328', --default: #272a30
--  fg = '#f8f8f0',
--  pink = '#f92672',
--  green = '#a6e22e',
--  cyan = '#66d9ef',
--  yellow = '#e6db74',
--  orange = '#fd971f',
--  red = '#e95678',
--}
--
---- Theme: Rosé Pine (main)
---- Colors: https://github.com/rose-pine/neovim/blob/main/lua/rose-pine/palette.lua
---- color names are adapted to the formats above
--M.rose_pine = {
--  bg = '#111019', --default: #191724
--  fg = '#e0def4',
--  pink = '#eb6f92',
--  green = '#9ccfd8',
--  cyan = '#31748f',
--  yellow = '#f6c177',
--  orange = '#2a2837',
--  red = '#ebbcba',
--}
--
---- Theme: gruvbox
----Colors: https://github.com/morhetz/gruvbox
--
--return M
