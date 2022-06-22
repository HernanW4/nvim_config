-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------


local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Function to show the documentation using Coc-doHover
function show_documentation() local filetype = vim.bo.filetype

   if filetype == 'vim'  or filetype == 'help' then
        vim.api.nvim_command('h ' .. filetype)

   elseif vim.fn['coc#rpc#ready']() then
     vim.fn.CocActionAsync('doHover')
   end
end
-- Change leader to a comma
map('n', '<space>', '<nop>', {noremap = true})

vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')
map('i', '<up>', '<nop>')
map('i', '<down>', '<nop>')
map('i', '<left>', '<nop>')
map('', '<right>', '<nop>')



-- tab Navigation
map('', '<left>', ':tabp<CR>')
map('', '<right>', ':tabn<CR>')

-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', 'L', '$')
map('n', 'H', '^')

-- Copy/Paste to clipboard
map('n', '<leader>y', '"*y')
map('n', '<leader>p', '"*p')

--Disale BuffWritePost autocomand when saving
--You could also overwrite the usual way of saving to disable autocomands
--
--map('n', ':w', ':noa :w')
--
-- Fast saving with <leader> and s
map('n', '<leader>s', ':noa :w<CR>')
map('i', '<leader>s', ':noa <C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close


-- Coc Keymaps
map('n', '[g', ':coc-diagnostics-prev')
map('n', ']g', ':coc-diagnostics-next')


map('n', 'gd', '<Plug>(coc-definition)')
map('n', 'gy', '<Plug>(coc-type-definition)')
map('n', 'gi', '<Plug>(coc-implementation)')
map('n', 'gr', '<Plug>(coc-references)')


--Reload lua config
map("n", "<leader>r", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })


map('n', 'K', ':lua show_documentation()<CR>')




--vim.api.nvim_set_keymap(
--	'n',
--	'K',
--	':lua show_documentation()<CR>',
--	{ noremap = false, silent = false }
--);
