local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  size = 65, --The size to which the new terminal will be open
  open_mapping = [[<C-\>]], --Open terminal
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float", --Type of opening the new terminal, vertical, horizontal, or float
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

function _G.set_terminal_keymaps() --Setup keymaps to handle the terminal
  local opts = { noremap = true }
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

local Terminal = require("toggleterm.terminal").Terminal --Use lazygit, this is pretty cool
local lazygit = Terminal:new {
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "none",
    width = 100000,
    height = 100000,
  },
  on_open = function(_)
    vim.cmd "startinsert!"
    -- vim.cmd "set laststatus=0"
  end,
  on_close = function(_)
    -- vim.cmd "set laststatus=3"
  end,
  count = 99,
}

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local node = Terminal:new { cmd = "node", hidden = true }

function _NODE_TOGGLE()
  node:toggle()
end

local ncdu = Terminal:new { cmd = "ncdu", hidden = true }

function _NCDU_TOGGLE()
  ncdu:toggle()
end

local htop = Terminal:new { cmd = "htop", hidden = true }

function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new { cmd = "python", hidden = true }

function _PYTHON_TOGGLE()
  python:toggle()
end

local cargo_run = Terminal:new { cmd = "clear && cargo run", hidden = true } --You have to have cargo run

function _CARGO_RUN()
  cargo_run:toggle()
end

local cargo_test = Terminal:new { cmd = "cargo test", hidden = true }

function _CARGO_TEST()
  cargo_test:toggle()
end




vim.api.nvim_set_keymap("n", "<A-g>", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-r>", "<cmd>lua _CARGO_RUN()<CR>", { noremap = true, silent = true })


--vim.api.nvim_set_keymap("n", "<m-3>", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("i", "<m-3>", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })
