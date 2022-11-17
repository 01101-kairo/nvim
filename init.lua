--| Settings plugs |============================================================
------------------------------------------------------------------------ Plugs
require "packerPlugs" ------------------------------------------ Plugs install

require "ftplugins.theme" -----------------------------------------------theme
require "ftplugins.hexokinase" ----------------------------------------- Color
require "ftplugins.treesitter" ------------------------------- ColorPars Sitax
require "ftplugins.highlight" -------------------------------------- highlight
require "ftplugins.bufferline" ------------------------------------ Bufferline
require "ftplugins.lualine" ------------------------------------------ lualine

require "ftplugins.cmp" -------------------------------------------------- CMP
require "ftplugins.lsp" -------------------------------------------------- LSP
require('jc').setup{}
require "nvim-tree".setup() ----------------------------------------- Explorer
require "toggleterm".setup() -------------------------------------- toggleterm
require "pears".setup()------------------------------------------------- Pears
require "Comment".setup()------------------------------------------ Comentario

--| Keymap |====================================================================
---------------------------------------------------------- Settings Neovim Lua
vim.api.nvim_command('autocmd TermEnter term://*toggleterm#* tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>')
local ops = { noremap = true, silent = true }
for _, mapping in ipairs({
  { '<F5>',  [[:TermExec cmd="run %" direction=float<CR>]] }, -- Run cod
  { '<C-t>', [[:exe v:count1 . "ToggleTerm direction=float"<CR>]] }, -- Terminal
  { '<C-s>', [[:w<CR>:syntax on<CR>]] }, -- Save
  { '<C-q>', [[:bp |bd #<CR>]] }, -- quit
  { '<C-h>', [[:NvimTreeToggle <CR>]] }, -- Explorer
  { '<F7>',  [[:set foldmethod=indent<CR>]] }, -- za desdobrar um por um, space tudo de uma vez
  -- Navigate
  { '<A-l>', [[:bn<CR>]] }, { '<A-Right>', [[:bn<CR>]] },
  { '<A-h>', [[:bp<CR>]] }, { '<A-Left>',  [[:bp<CR>]] },
  -- switch between windows
  -- { '<C-h>', [[<C-w>h]] },
  { '<C-l>', [[<C-w>l]] },
  { '<C-j>', [[<C-w>j]] },
  { '<C-k>', [[<C-w>k]] },
})
  do vim.keymap.set('n', mapping[1], mapping[2], ops)
end

--| Settings |==================================================================
---------------------------------------------------------- Settings Neovim Lua
local set = vim.opt
set.syntax = "enable"
set.clipboard = "unnamedplus" -- compartilhamento de área de trasferencia
set.history = 500 -- 500 é um numero grande
set.smarttab = true
set.incsearch = true -- isso aqui é pra 'pesquisa' ele completa palavras

set.guifont = { "DejaVuSansMono Nerd Font", "Mono:h12" }
set.termencoding = "utf8" -- Yeah!! UTF-8 em tudo!
set.colorcolumn = "80"
set.tw = 79
set.updatetime = 300 -- mensagem de erro

set.laststatus = 3 -- global statusline
set.showmode = false

-- Indenting
set.smartindent = true -- ativa autoindent da linguagens que eu tiver trabalhondo
set.softtabstop = 2 -- numero de espaços que deve-se dar quando apertar o TAB
set.tabstop = 2 -- show existing tab with 2 spaces width
set.shiftwidth = 2 -- when indenting with '>', use 2 spaces width

set.expandtab = true -- On pressing tab, insert 4 spaces

set.fillchars = { eob = " " }
set.ignorecase = true
set.smartcase = true
-- set.mouse = "a" -- isso memo mouse no vim hooooo

-- Numbers
set.number = true -- só pra eu saber qual linha eu to
set.numberwidth = 2
set.ruler = false

-- disable nvim intro
set.shortmess:append("sI")

set.signcolumn = "yes"
set.splitbelow = true -- Create the horizontal splits below
set.splitright = true -- Create the vertical splits to the right
set.timeoutlen = 400
set.undofile = true

set.scrolloff = 8
set.cmdheight = 2
set.list = true
set.hidden = true
set.cindent = true -- indentação no estilo C
set.cursorline = true -- ondiéqueeuto
set.sm = true -- mostra o início do bloco que acabou de ser fechado, sm é o mesmo que ShowMatch
set.ai = true -- auto indent
set.relativenumber = true -- numero relativo (esses numeros mudando)
set.autoread = true -- Update vim after file update from outside
set.title = true -- exibe alguma coisa na bara do terminal
set.autoindent = true -- aoutoindent
set.wildmenu = true -- menuzinho de completar comandos vim
set.confirm = true -- confirma exit
set.whichwrap:append("<>[]hl") -- when cursor reaches end/beginning of line
set.wrap = false -- linha longa
