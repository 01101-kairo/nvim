local g = vim.g
local a = vim.api
local opt = vim.opt
local cmd = vim.cmd
local set = vim.api.nvim_set_keymap
local ns = {noremap=true, silent=true}

-- set nocompatible
a.nvim_command("syntax on")
a.nvim_command("filetype on")
a.nvim_command("filetype plugin on")
a.nvim_command("filetype indent on")
a.nvim_command("filetype plugin indent on")
a.nvim_command("set diffopt& diffopt+=algorithm:histogram,indent-heuristic")
a.nvim_command("set rtp+=~/.fzf")			-- vc sabe oq é isso?
a.nvim_command("set is hls ic scs")		-- opções de busca
a.nvim_command("set nocompatible")			-- be improved, required
a.nvim_command("set nowrap")					-- linha longa
a.nvim_command("set bs=2")					-- para o backspace se comportar como a gente gosta
a.nvim_command("set t_Co=256")				-- real ñ sei pq isso mas eu gosto de me previnir com relação a cores
a.nvim_command("set signcolumn=yes")
a.nvim_command("set encoding=utf8")			-- sou br é eu escrevo em portugues eu acho

-- opt.fdm=marke			-- o modo como o folding deverá trabalhar
-- opt.eb=true					-- ná morauzinha eu ñ sei oq isso faz
-- opt.laststatus=2			-- parece q eu ñ precisso disso mas deixa ai
-- opt.wildmode=longest,list	-- para completar com TAB igualzinho o bash faz

opt.colorcolumn = '80'
opt.guifont={"DejaVuSansMono Nerd Font","Mono:h12"}
opt.number=true				-- só pra eu saber qual linha eu to
opt.tw=79
opt.termguicolors=true
opt.history=500				-- 500 é um numero grande
opt.cindent=true			-- indentação no estilo C
opt.cursorline=true			-- ondiéqueeuto
opt.updatetime=300			--mensagem de erro
opt.clipboard=unnamedplus	-- compartilhamento de área de trasferencia
opt.sm=true					-- mostra o início do bloco que acabou de ser fechado, sm é o mesmo que ShowMatch
opt.ai=true					-- auto indent
opt.shiftwidth=4			-- numero de espaço usado quando rolar o autoindent
opt.softtabstop=4			-- numero de espaços que deve-se dar quando apertar o TAB
opt.tabstop=4				-- numero de espações que deve-se voltando quando apertar o backspace num tab
opt.termencoding=utf8		-- Yeah!! UTF-8 em tudo!
opt.relativenumber=true		-- numero relativo (esses numeros mudando)
opt.hidden=true
opt.incsearch=true			-- isso aqui é pra 'pesquisa' ele completa palavras
opt.ignorecase=true
opt.smartcase=true
opt.splitright=true			-- Create the vertical splits to the right
opt.splitbelow=true			-- Create the horizontal splits below
opt.autoread=true			-- Update vim after file update from outside
opt.scrolloff=8
opt.title=true				-- exibe alguma coisa na bara do terminal
opt.cmdheight=2
opt.autoindent=true			-- aoutoindent
opt.smartindent=true		-- ativa autoindent da linguagens que eu tiver trabalhondo
opt.wildmenu=true			-- menuzinho de completar comandos vim
opt.mouse='a'				-- isso memo mouse no vim hooooo
opt.confirm=true			-- confirma exit

-- Key Map
set("n","<F7>",":set foldmethod=indent<CR>",ns)
set("n","<F5>",":call Run(shellescape(@%, 1))<CR>",ns)
set("n","<C-s>",":w<CR>",ns)
-- set("n","<C-i>",":set foldmethod=indent<CR>",ns)
set("n","<C-h>",":NERDTreeToggle<CR>",ns)
-- set("n","<C-n>",":tabnew ",ns)
set("n","<C-q>",":bp |bd #<CR>",ns)
set("n","<M-l>",":bn<CR>",ns)
set("n","<M-h>",":bp<CR>",ns)
set("n","<space>"," za",ns)

-- Shortcuts for split navigation
set("n","<C-j>","<C-w>j",ns)
set("n","<C-k>","<C-w>k",ns)
set("n","<C-l>","<C-w>l",ns)

-- Java
-- vim.cmd([[
-- augroup java
-- 	au!
-- 	autocmd FileType java setlocal omnifunc=javacomplete#Complete
-- 	autocmd BufReadPost,BufWritePost *.java :NeomakeFile
-- augroup end]])

-- ULtiSnips
g['ULtiSnipsEditSplit'] = 'vertical'
g['ULtiSnipsJumpForwardTrigger'] = '<TAB>'
g['ULtiSnipsJumpBackwardTrigger'] = '<s-TAB>'

-- coc
g['coc_force_debug'] = 1

-- ale
vim.cmd([[
let g:ale_linters = {
			\	'python': ['flake8', 'pylint'],
			\	'javascript': ['eslint'],
			\	'cpp':[],
			\	'c': [],
			\}

let g:ale_fixers = {
			\   '*': ['trim_whitespace'],
			\   'cpp': ['clang-format'],
			\   'c': ['clang-format'],
			\}

"C/C++
let g:ale_c_clangformat_options = '"-style={
			\ BasedOnStyle: google,
			\ IndentWidth: 2,
			\ColumnLimit: 100,
			\ AllowShortBlocksOnASingleLine: Always,
			\ AllowShortFunctionsOnASingleLine: Inline,
			\ FixNamespaceComments: true,
			\ ReflowComments: false,
			\ }"']])
g['ale_fix_on_save'] = 1
g['ale_completetion_enable'] = 0
g['neocomplete#enable_at_startup'] = 1
g['loaded_node_provider'] = 0
g['loaded_perl_provider'] = 0

-- SuperTab
g['SuperTabDefaultCompletionType'] = '<c-n>'

cmd([[imap <C-l> <Plug>(coc-snippets-expand)]])		--Use <C-l> for trigger snippet expand.
cmd([[vmap <C-j> <Plug>(coc-snippets-select)]])		--Use <C-j> for select text for visual placeholder of snippet.
g['coc_snippet_next']= '<C-j>'			--Use <C-j> for jump to next placeholder, it's default of coc.nvim
g['coc_snippet_prev']= '<c-k>'			--Use <C-k> for jump to previous placeholder, it's default of coc.nvim
cmd([[imap <C-j> <Plug>(coc-snippets-expand-jump)]])	--Use <C-j> for both expand and jump (make expand higher priority.)
cmd([[xmap <leader>x  <Plug>(coc-convert-snippet)]])	--Use <leader>x for convert visual selected code to snippet

-- Macros
vim.cmd([[autocmd FileType html inoremap <Space><Space> <Esc>/<++><Enter>"_c4l]])

cmd([[
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>']])

-- Themes
g['airline#extensions#tabline#formatter'] = 'unique_tail'
g['airline#extensions#tabline#enabled'] = 1
g['airline#extensions#tabline#left_sep'] = ' '
g['airline#extensions#tabline#left_alt_sep'] = '|'

vim.cmd([[
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif]])

g['sonokai_style'] = 'andromeda'
g['sonokai_enable_italic'] = 1
g['sonokai_disable_italic_comment'] = 0
g['sonokai_diagnostic_line_highlight'] = 1
g['sonokai_current_word'] = 'bold'

vim.cmd([[
packadd! sonokai
colorscheme sonokai

if (has("nvim")) "Transparent background. Only for nvim
	highlight Normal guibg=NONE ctermbg=NONE
	highlight EndOfBuffer guibg=NONE ctermbg=NONE
endi]])

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
}

-- Run COD
vim.cmd([[function! Run(arq)
	:w
	if &filetype == 'html'
		:Bracey
	elseif &filetype == 'Java'
		:!javac '%' && java '%'
	elseif &filetype == 'markdown'
		:exec '!glow' a:arq
	elseif &filetype == 'python'
		:exec '!python3' a:arq
	elseif &filetype == 'c'
		:exec '!clang -o /tmp/a.out' a:arq ';/tmp/a.out'
	endif
endfunctio]])
