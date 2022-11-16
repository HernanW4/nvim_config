-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

function _G.reload_nvim_conf()
  for name,_ in pairs(package.loaded) do
    if name:match('^core') or name:match('^lsp') or name:match('^plugins') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Change leader to a comma
map('n', '<space>', '<nop>', {noremap = true})

vim.g.mapleader = ','


-- tab Navigation
map('', '<left>', ':tabp<CR>')
map('', '<right>', ':tabn<CR>')

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')
map('i', '<up>', '<nop>')
map('i', '<down>', '<nop>')
map('i', '<left>', '<nop>')
map('', '<right>', '<nop>')


-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical


-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', 'L', '$')
map('n', 'H', '0')


-- Fast saving with <leader> and s
map('n', '<leader>s', ':noa :w<CR>')
map('i', '<leader>s', ':noa <C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')



-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close


map('n', '<C-m>', '<Plug>MarkdownPreview')
map('n', '<C-s>', '<Plug>MarkdownPreviewStop')
--nmap <M-s> <Plug>MarkdownPreviewStop
--nmap <C-p> <Plug>MarkdownPreviewToggle


--Reload lua config
map("n", "<leader>r", "<cmd>lua reload_nvim_conf()<CR>", { noremap = true, silent = false })
