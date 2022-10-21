local opt = vim.opt
local g = vim.g
local o = vim.o
local command = vim.api.nvim_command
-------------------------------------------------------------- set nocompatible
command("syntax on")
command("filetype on")
command("filetype plugin on")
command("filetype indent on")
command("filetype plugin indent on")
command("set diffopt& diffopt+=algorithm:histogram,indent-heuristic")
command("set is hls ic scs")-- opções de busca
command("set nocompatible")	-- be improved, required
command("set nowrap")		-- linha longa
command("set bs=2")			-- para o backspace se comportar como a gente gosta
command("set t_Co=256")		-- real ñ sei pq isso mas eu gosto de me previnir com relação a cores
command("set encoding=utf8")-- sou br é eu escrevo em portugues eu acho
o.clipboard = 'unnamedplus'	-- compartilhamento de área de trasferencia
o.history=500				-- 500 é um numero grande
o.smarttab=true
o.incsearch=true			-- isso aqui é pra 'pesquisa' ele completa palavras

opt.guifont={"DejaVuSansMono Nerd Font","Mono:h12"}
opt.termencoding='utf8'		-- Yeah!! UTF-8 em tudo!
opt.colorcolumn = '80'
opt.tw=79
opt.updatetime=300			-- mensagem de erro

opt.laststatus = 3 -- global statusline
opt.showmode = false
-- Indenting
opt.shiftwidth = 2
opt.smartindent=true		-- ativa autoindent da linguagens que eu tiver trabalhondo
opt.tabstop = 2
opt.softtabstop= 2			-- numero de espaços que deve-se dar quando apertar o TAB

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse='a'				-- isso memo mouse no vim hooooo

-- Numbers
opt.number=true				-- só pra eu saber qual linha eu to
opt.numberwidth = 2
opt.ruler = false


-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow=true			-- Create the horizontal splits below
opt.splitright=true			-- Create the vertical splits to the right
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

opt.scrolloff=8
opt.cmdheight=2
opt.list = true
opt.listchars:append "eol:↴"
opt.hidden=true
opt.expandtab=true
opt.cindent=true			-- indentação no estilo C
opt.cursorline=true			-- ondiéqueeuto
opt.sm=true					-- mostra o início do bloco que acabou de ser fechado, sm é o mesmo que ShowMatch
opt.ai=true					-- auto indent
opt.relativenumber=true		-- numero relativo (esses numeros mudando)
opt.autoread=true			-- Update vim after file update from outside
opt.title=true				-- exibe alguma coisa na bara do terminal
opt.autoindent=true			-- aoutoindent
opt.wildmenu=true			-- menuzinho de completar comandos vim
opt.confirm=true			-- confirma exit
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = " "
