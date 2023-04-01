local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

--require("telescope").load_extension('zoxide')

require('telescope').load_extension('fzf')


--vim.keymap.set("n", "<leader>cd", require("telescope").extensions.zoxide.list)
