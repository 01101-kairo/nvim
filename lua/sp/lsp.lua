-- Settings plugs =============================================================
------------------------------------------------------ LSPs with default setup:
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

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
	"emmet-ls", -- emmet_ls (HTML)
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

lspconfig.emmet_ls.setup({
	-- on_attach = on_attach,
	capabilities = vim.lsp.protocol.make_client_capabilities(),
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

capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Diagnostics symbols for display in the sign column.
local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
