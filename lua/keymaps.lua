function _G.reload_nvim_conf()
  for name,_ in pairs(package.loaded) do
    if name:match('^core') or name:match('^lsp') or name:match('^plugins') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end



vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' ' --Sets space as vim.keymap.set leader


--GODLY
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })



vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")


--Copying to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--Deleting better deleting
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--Pasting without overwriting
vim.keymap.set("x", "<leader>p", "\"_dP")

--Movin half pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--vim.keymap.set("n", "<leader>pv", vim.cmdEx)
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true })


vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>')

-- tab Navigation
vim.keymap.set('', '<left>', ':tabp<CR>')
vim.keymap.set('', '<right>', ':tabn<CR>')

-- Disable keys
vim.keymap.set('', '<up>', '<nop>')
vim.keymap.set('', '<down>', '<nop>')
vim.keymap.set('', '<left>', '<nop>')
vim.keymap.set('', '<right>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('', '<right>', '<nop>')
vim.keymap.set('', '<tab>', '<nop>')


vim.keymap.set('', '<C-m>', '<nop>')



-- Change split orientation
vim.keymap.set('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
vim.keymap.set('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical


-- Close all windows and exit from Neovim with <leader> and q
vim.keymap.set('n', '<leader>q', ':qa!<CR>')


-- Terminal mappings
vim.keymap.set('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')                    -- exit



--vim.keymap.set('n', '<C-m>', '<Plug>MarkdownPreview')
--vim.keymap.set('n', '<C-s>', '<Plug>MarkdownPreviewStop')
--nmap <M-s> <Plug>MarkdownPreviewStop
--nmap <C-p> <Plug>MarkdownPreviewToggle


--Reload lua config
vim.keymap.set("n", "<leader>r", "<cmd>lua reload_nvim_conf()<CR>", { noremap = true, silent = false })


--Autocompletion stuff
vim.keymap.set("i", "(" ,"()<Esc>i", {noremap = true})
vim.keymap.set("i", "[" ,"[]<Esc>i", {noremap = true})
vim.keymap.set("i", "\"" ,"\"\"<Esc>i", {noremap = true})
vim.keymap.set("i", "{" ,"{}<Esc>i", {noremap = true})


--Harpoon

vim.keymap.set("n", "<C-e>" ,":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>a" ,":lua require(\"harpoon.mark\").add_file()<CR>", {noremap = true, silent = true})

