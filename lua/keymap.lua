-- Keymap =====================================================================
----------------------------------------------------------------------- Key Map
local toggle_modes = { "n", "t" }
local terminal = require("nvterm.terminal")

local fn = vim.fn.expand
local ft_cmds = {
  c = "run " .. fn("%"),
  javascript = "node " .. fn("%"),
  html = "live-server $(pwd) ",
  css = "live-server $(pwd) ",
  scss = "live-server $(pwd) ",
  python = "python3 " .. fn("%"),
  java = "run " .. fn("%"),
}

-- local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>" : coc#refresh()', opts)
-- vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], opts)

local mappings = {
  -- Terminal
  {toggle_modes,"<A-t>",function()terminal.toggle("horizontal")end,},
  {toggle_modes,"<A-v>",function()terminal.toggle("vertical")end,},
  {toggle_modes,"<A-i>",function()terminal.toggle("float")end,},
  {"n","<F5>",function()terminal.send(ft_cmds[vim.bo.filetype])end,},
  -- za desdobrar um por um, space tudo de uma vez
  { "n", "<F7>", ":set foldmethod=indent<CR>" },
  -- Save
  { "n", "<C-s>", ":w<CR>" },
  -- quit
  { "n", "<C-q>", ":bp |bd #<CR>" },
  -- Navigate
  { "n", "<A-l>", ":bn<CR>" },
  { "n", "<A-h>", ":bp<CR>" },
  { "n", "<A-Right>", ":bn<CR>" },
  { "n", "<A-Left>", ":bp<CR>" },
  -- switch between windows
  -- { 'n', '<C-h>', '<C-w>h'},
  { "n", "<C-l>", "<C-w>l" },
  { "n", "<C-j>", "<C-w>j" },
  { "n", "<C-k>", "<C-w>k" },
  -- Explorer
  { "n", "<C-h>", ":NvimTreeToggle <CR>" },
  { "i", "<C-h>", "<ESC>:NvimTreeToggle<CR>" },
}

local nl = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], nl)
end
