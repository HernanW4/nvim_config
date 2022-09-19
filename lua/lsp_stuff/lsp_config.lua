-- Add additional capabilities supported by nvim-cmp
local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')


local ensured_servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "html",
  "jdtls",
  "jsonls",
  "solc",
  "solidity_ls",
  "sumneko_lua",
  "tflint",
  "terraformls",
  "tsserver",
  "pyright",
  "yamlls",
  "bashls",
  "clangd",
  "rust_analyzer",
  "taplo",
  "lemminx"
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)

mason_lspconfig.setup{
    ensured_installed = ensured_servers,
    automatic_installation = false,
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local opts = {}
for _, lsp in ipairs(ensured_servers) do
  opts = {
    on_attach = require('lsp_stuff.handlers').on_attach,
    capabilities = require('lsp_stuff.handlers').capabilities,

  }
  if lsp == "sumneko_lua" then
      local l_status_ok, lua_dev = pcall(require, "lua-dev")
      if not l_status_ok then
          return
      end

      local luadev = lua_dev.setup{
      lspconfig = {
          on_attach = opts.on_attach,
          capabilities = opts.capabilities,
      },
  }
  lspconfig.sumneko_lua.setup(luadev)
  end
  if lsp == "rust_analyzer" then
    local rust_opts = require("lsp_stuff.server_settings.rust")
    local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
    if not rust_tools_status_ok then
        return
    end

    rust_tools.setup(rust_opts)
    goto continue

  end
  lspconfig[lsp].setup(opts)
  ::continue::
end
