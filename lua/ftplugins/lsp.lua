--| Settings plugs |============================================================
------------------------------------------------------ LSPs with default setup:
require("mason").setup({})
require("nvim-lsp-installer").setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = {
  "bashls", -- bashls (Bash)
  "cssls", -- cssls (CSS)
  -- "emmet-ls", -- emmet_ls (HTML)
  "html", -- html (HTML)
  "clangd", -- clangd (C/C++)
  "jsonls", -- jsonls (JSON)
  "eslint", -- eslint (JS)
  "tsserver", -- tsserver (Typescript)
  "pyright", -- pyright (Python)
  "sumneko_lua", -- sumneko_lua (Lua)
  "jdtls", -- jdtls (Java)
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  },
})

lspconfig.jdtls.setup({
  cmd = {
    '/usr/bin/java',
    '-javaagent:/home/kairo/.local/share/nvim/lsp_servers/jdtls/lombok.jar',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    '/home/kairo/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration',
    '/home/kairo/.local/share/nvim/lsp_servers/jdtls/config_linux',
    '-data',
    '/home/kairo/.local/share/jc.nvim/workspaces/_home_kairo_Downloads_demo-1_pom_xml',
  },
})

capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Diagnostics symbols for display in the sign column.
local signs = { Error = "", Warn = "", Hint = " ", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
