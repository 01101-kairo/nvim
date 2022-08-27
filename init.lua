------------------------------------------------------------------------------
local g = vim.g
local o = vim.o
local api = vim.api
local opt = vim.opt
local cmd = vim.cmd
local command = api.nvim_command
local keymap = vim.api.nvim_set_keymap
local ns = {noremap=true, silent=true}

------------------------------------------------------------- set nocompatible
command("syntax on")
command("filetype on")
command("filetype plugin on")
command("filetype indent on")
command("filetype plugin indent on")
command("set diffopt& diffopt+=algorithm:histogram,indent-heuristic")
command("set signcolumn=yes")
command("set rtp+=~/.fzf")		-- vc sabe oq é isso?
command("set is hls ic scs")	-- opções de busca
command("set nocompatible")		-- be improved, required
command("set nowrap")			-- linha longa
command("set bs=2")				-- para o backspace se comportar como a gente gosta
command("set t_Co=256")			-- real ñ sei pq isso mas eu gosto de me previnir com relação a cores
command("set encoding=utf8")	-- sou br é eu escrevo em portugues eu acho

o.clipboard = 'unnamedplus'	    -- compartilhamento de área de trasferencia
-- opt.fdm=marke			    -- o modo como o folding deverá trabalhar
-- opt.eb=true				    -- ná morauzinha eu ñ sei oq isso faz
-- opt.laststatus=2			    -- parece q eu ñ precisso disso mas deixa ai
opt.guifont={"DejaVuSansMono Nerd Font","Mono:h12"}
opt.termencoding=utf8		-- Yeah!! UTF-8 em tudo!
opt.mouse='a'				-- isso memo mouse no vim hooooo
opt.colorcolumn = '80'
opt.tw=79
opt.history=500				-- 500 é um numero grande
opt.updatetime=300			--mensagem de erro
opt.shiftwidth=4			-- numero de espaço usado quando rolar o autoindent
opt.softtabstop=4			-- numero de espaços que deve-se dar quando apertar o TAB
opt.tabstop=4				-- numero de espações que deve-se voltando quando apertar o backspace num tab
opt.scrolloff=8
opt.cmdheight=2
opt.termguicolors=true
opt.hidden=true
opt.ignorecase=true
opt.smartcase=true
opt.smarttab=true
opt.expandtab=true
opt.incsearch=true			-- isso aqui é pra 'pesquisa' ele completa palavras
opt.number=true				-- só pra eu saber qual linha eu to
opt.cindent=true			-- indentação no estilo C
opt.cursorline=true			-- ondiéqueeuto
opt.sm=true					-- mostra o início do bloco que acabou de ser fechado, sm é o mesmo que ShowMatch
opt.ai=true					-- auto indent
opt.relativenumber=true		-- numero relativo (esses numeros mudando)
opt.splitright=true			-- Create the vertical splits to the right
opt.splitbelow=true			-- Create the horizontal splits below
opt.autoread=true			-- Update vim after file update from outside
opt.title=true				-- exibe alguma coisa na bara do terminal
opt.autoindent=true			-- aoutoindent
opt.smartindent=true		-- ativa autoindent da linguagens que eu tiver trabalhondo
opt.wildmenu=true			-- menuzinho de completar comandos vim
opt.confirm=true			-- confirma exit

----------------------------------------------------------------------- Key Map
keymap("n","<F7>",":set foldmethod=indent<CR>",ns)
keymap("n","<F5>",":call Run(shellescape(@%, 1))<CR>",ns)
keymap("n","<C-s>",":w<CR>",ns)
keymap("n","<C-h>",":NERDTreeToggle<CR>",ns)
keymap("n","<C-q>",":bp |bd #<CR>",ns)
keymap("n","<M-l>",":bn<CR>",ns)
keymap("n","<M-h>",":bp<CR>",ns)
keymap("n","<space>"," za",ns)
keymap("n","<C-j>","<C-w>j",ns)
keymap("n","<C-k>","<C-w>k",ns)
keymap("n","<C-l>","<C-w>l",ns)

--------------------------------------------------------------------- ULtiSnips
g['ULtiSnipsEditSplit'] = 'vertical'
g['ULtiSnipsJumpForwardTrigger'] = '<TAB>'
g['ULtiSnipsJumpBackwardTrigger'] = '<s-TAB>'

-- ale
vim.cmd([[let g:ale_linters = {
            \	'python': ['flake8', 'pylint'],
            \	'javascript': ['eslint'],
            \	'cpp':[],
            \	'c': [],
\}]])

vim.cmd([[let g:ale_fixers = {
            \   '*': ['trim_whitespace'],
            \   'cpp': ['clang-format'],
            \   'c': ['clang-format'],
\}]])

vim.cmd([[let g:ale_c_clangformat_options = '"-style={
            \ BasedOnStyle: google,
            \ IndentWidth: 2,
            \ ColumnLimit: 100,
            \ AllowShortBlocksOnASingleLine: Always,
            \ AllowShortFunctionsOnASingleLine: Inline,
            \ FixNamespaceComments: true,
            \ ReflowComments: false,
\}"']])

g['ale_fix_on_save'] = 1
g['ale_completetion_enable'] = 0
g['neocomplete#enable_at_startup'] = 1
g['loaded_node_provider'] = 0
g['loaded_perl_provider'] = 0

-------------------------------------------------------------------------- Coc
cmd([[inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ CheckBackSpace() ? "\<TAB>" :
          \ coc#refresh()

    function! CheckBackSpace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
]])

----------------------------------------------------------------------- Themes
g['airline#extensions#tabline#formatter'] = 'unique_tail'
g['airline#extensions#tabline#enabled'] = 1
g['airline#extensions#tabline#left_sep'] = ' '
g['airline#extensions#tabline#left_alt_sep'] = '|'

vim.cmd([[
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
]])

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
    endi
]])

-- opt.list = true
-- opt.listchars:append "space:⋅"
-- opt.listchars:append "eol:↴"

cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

cmd([[
  hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFFFF
  let g:indentLine_fileTypeExclude = ['dashboard']
]])

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

---------------------------------------------------------------------- Run COD
cmd([[function! Run(arq)
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
    endfunctio
]])
