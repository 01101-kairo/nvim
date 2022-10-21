local set = vim.api.nvim_set_keymap
local ns = {noremap=true, silent=true}

--------------------------------------------------------------------------- Coc
vim.cmd [[inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]]
vim.cmd [[inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"]]
vim.cmd [[inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]]

----------------------------------------------------------------------- Key Map
set("n", "<Leader>cc",":Commentary",ns)
set("v", "<Leader>cc",":Commentary",ns)

set("n","<F7>",":set foldmethod=indent<CR>",ns) -- za desdobrar um por um, space tudo de uma vez
-- save
set("n","<C-s>",":w<CR>",ns)
-- quit
set("n","<C-q>",":bp |bd #<CR>",ns)
--navigate right
set("n","<M-l>",":bn<CR>",ns)
-- navigate left
set("n","<M-h>",":bp<CR>",ns)
-- toggle
set("n","<C-h>",":CocCommand explorer<CR>",ns)
set("i","<C-h>",":CocCommand explorer<CR>",ns)
-- switch between windows
-- set("n","<C-h>","<C-w>h",ns)
set("n","<C-l>","<C-w>l",ns)
set("n","<C-j>","<C-w>j",ns)
set("n","<C-k>","<C-w>k",ns)

















-- M.lspconfig = {
--   plugin = true,
--
--   -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
--
--   n = {
--     ["gD"] = {
--       function()
--         vim.lsp.buf.declaration()
--       end,
--       "lsp declaration",
--     },
--
--     ["gd"] = {
--       function()
--         vim.lsp.buf.definition()
--       end,
--       "lsp definition",
--     },
--
--     ["K"] = {
--       function()
--         vim.lsp.buf.hover()
--       end,
--       "lsp hover",
--     },
--
--     ["gi"] = {
--       function()
--         vim.lsp.buf.implementation()
--       end,
--       "lsp implementation",
--     },
--
--     ["<leader>ls"] = {
--       function()
--         vim.lsp.buf.signature_help()
--       end,
--       "lsp signature_help",
--     },
--
--     ["<leader>D"] = {
--       function()
--         vim.lsp.buf.type_definition()
--       end,
--       "lsp definition type",
--     },
--
--     ["<leader>ra"] = {
--       function()
--         require("nvchad_ui.renamer").open()
--       end,
--       "lsp rename",
--     },
--
--     ["<leader>ca"] = {
--       function()
--         vim.lsp.buf.code_action()
--       end,
--       "lsp code_action",
--     },
--
--     ["gr"] = {
--       function()
--         vim.lsp.buf.references()
--       end,
--       "lsp references",
--     },
--
--     ["<leader>f"] = {
--       function()
--         vim.diagnostic.open_float()
--       end,
--       "floating diagnostic",
--     },
--
--     ["[d"] = {
--       function()
--         vim.diagnostic.goto_prev()
--       end,
--       "goto prev",
--     },
--
--     ["d]"] = {
--       function()
--         vim.diagnostic.goto_next()
--       end,
--       "goto_next",
--     },
--
--     ["<leader>q"] = {
--       function()
--         vim.diagnostic.setloclist()
--       end,
--       "diagnostic setloclist",
--     },
--
--     ["<leader>fm"] = {
--       function()
--         vim.lsp.buf.format { async = true }
--       end,
--       "lsp formatting",
--     },
--
--     ["<leader>wa"] = {
--       function()
--         vim.lsp.buf.add_workspace_folder()
--       end,
--       "add workspace folder",
--     },
--
--     ["<leader>wr"] = {
--       function()
--         vim.lsp.buf.remove_workspace_folder()
--       end,
--       "remove workspace folder",
--     },
--
--     ["<leader>wl"] = {
--       function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--       end,
--       "list workspace folders",
--     },
--   },
-- }
