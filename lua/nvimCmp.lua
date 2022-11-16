local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local check_backspace = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end


local WIDE_HEIGHT = 40

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'


vim.api.nvim_set_hl(0, "DocumentationNormal", {bg = NONE, fg = "#ffbd4a"})

vim.api.nvim_set_hl(0, "MyNormal", {bg = NONE, fg = "#aaafff"})

vim.api.nvim_set_hl(0, "MyFloatBorder", {bg = NONE, fg = "#988829"})

vim.api.nvim_set_hl(0, "MyCursorLine", {bg = "#988829", fg = "#000000"})

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
      completion =  cmp.config.window.bordered(),
--          border = 'rounded',
--          scrollbar = '||',
--          winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine",
     documentation = cmp.config.window.bordered(),
--      border = 'rounded',
--      winhighlight = "Normal:DocumentationNormal,FloatBorder:MyFloatBorder",
--      maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
--      maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
  },

  formatting = {
      format = function(entry, vim_item)
          vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
          return vim_item
      end
  },
   --heere
   mapping = cmp.mapping.preset.insert {
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<m-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-c>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<m-j>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<m-k>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<m-c>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<S-CR>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Right>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif check_backspace() then
        -- cmp.complete()
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
   sources = {
    { name = 'luasnip' },
    { name = 'buffer'  },
    { name = 'nvim_lsp' },

  },
  }


--Nasty code but for now is to deal with hover menu
vim.cmd([[hi link NormalFloat Normal]])
