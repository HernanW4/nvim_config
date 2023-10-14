local lsp = require("lsp-zero")


lsp.preset("recommended")

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
      info = '',
      hint = '',
      warning = '',
      error = ''
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end)


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
      'rust_analyzer',
      'lua_ls'
  },
  handlers = {
    lsp.default_setup,
  },
})

lsp.setup()

--Diagnostics 
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    manage_nvim_cmp = true,
    virtual_text = {
        prefix = '●'
    },
    float = {
        source = "always"
    },
    signs = true,

})

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]



