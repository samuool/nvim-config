local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr}
  vim.keymap.set('n', '<Leader>ce', vim.lsp.buf.code_action, opts)
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3vim.lsp.buf.code_action().x/doc/md/guide/integrate-with-mason-nvim.md
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'lua_ls', 'pyright', 'jsonls', 'yamlls', 'dockerls', 'markdown_oxide', 'eslint'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    lua_ls=function()
        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                  diagnostics = {
                    globals = {"vim"},
                  },
              },
          },
      })
    end,
    tsserver=function()
        require('lspconfig').tsserver.setup({
            init_options={
                preferences={
                    importModuleSpecifierEnding="js"
                }
            }
        })
    end,
    eslint=function()
        require('lspconfig').eslint.setup({
                settings = {
      format = false,
      workingDirectory = {
        mode = 'location'
      }
    },
        })
    end
  },
})

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ['<CR>'] = cmp.mapping.confirm({select = false})
  }),
})
