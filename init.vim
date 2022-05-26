" set comand Neovim -------------------------------------------------------------------------------
set nocompatible " be improved, required
syntax on
filetype on
filetype plugin on
filetype indent on
" filetype plugin indent on
set termguicolors
set cindent " indentação no estilo C
set history=500 " 500 é um numero grande
set cursorline " ondiéqueeuto
set guifont=DejaVuSansMono\ Nerd\ Font\ Mono:h12
set is hls ic scs " opções de busca
set updatetime=300 "mensagem de erro
set clipboard=unnamedplus " compartilhamento de área de trasferencia
set sm " mostra o início do bloco que acabou de ser fechado, sm é o mesmo que ShowMatch
set wildmode=longest,list " para completar com TAB igualzinho o bash faz
set ai " auto indent
set shiftwidth=4 " numero de espaço usado quando rolar o autoindent
set softtabstop=4 " numero de espaços que deve-se dar quando apertar o TAB
set tabstop=4 " numero de espações que deve-se voltando quando apertar o backspace num tab
set bs=2 " para o backspace se comportar como a gente gosta
" set fdm=marke " o modo como o folding deverá trabalhar
set termencoding=utf8 " Yeah!! UTF-8 em tudo!
set encoding=UTF-8
set relativenumber " numero relativo (esses numeros mudando)
set nu! " só pra eu saber qual linha eu to
" set eb " ná morauzinha eu ñ sei oq isso faz
set hidden
set incsearch " isso aqui é pra 'pesquisa' ele completa palavras
set ignorecase
set smartcase
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set scrolloff=8
set colorcolumn=100
set title " exibe alguma coisa na bara do terminal
" set laststatus=2 " parece q eu ñ precisso disso mas deixa ai
set t_Co=256 " real ñ sei pq isso mas eu gosto de me previnir com relação a cores
set signcolumn=yes
set cmdheight=2
set nowrap " linha longa
set encoding=utf8 " sou br é eu escrevo em portugues eu acho
set autoindent " aoutoindent
set smartindent " ativa autoindent da linguagens que eu tiver trabalhondo
set wildmenu " menuzinho de completar comandos vim
set mouse=a " isso memo mouse no vim hooooo
set confirm " confirma exit
set rtp+=~/.fzf " vc sabe oq é isso .
set diffopt& diffopt+=algorithm:histogram,indent-heuristic
" set tags=./tags;/
" set foldmethod=indent
" Key Map -----------------------------------------------------------------------------------------
nmap <C-s> :w <CR>
nmap <C-i> :set foldmethod=indent <CR>
nmap <M-t> :tabnew
"nmap <C-j> :CocCommand java.debug.vimspector.start<CR>
"map gc <plug>NERDCommenterInvert
nnoremap <C-h> :NERDTreeToggle<CR>
nnoremap <M-l> :bn <cr>
nnoremap <M-h> :bp <cr>
nnoremap <C-q> :bp \|bd #<cr>
nnoremap <space> za
nnoremap <F5> :call Executar(shellescape(@%, 1))<CR>
" Shortcuts for split navigation
" map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Macros ------------------------------------------------------------------------------------------
autocmd FileType html inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
" -------[ Outras coisas do Neovim ]---------------------------------------------------------------
" RUN COD -----------------------------------------------------------------------------------------
function! Executar(arq)
	:w
	if &filetype == 'html'
		:exec '!qutebrowser' a:arq
	elseif &filetype == 'Java'
		:!javac '%' && java '%'
	elseif &filetype == 'python'
		:exec '!python3' a:arq
	elseif &filetype == 'c'
		:exec '!clang -o /tmp/a.out' a:arq ';/tmp/a.out'
	endif
endfunctio
" Java --------------------------------------------------------------------------------------------
augroup java
	au!
	autocmd FileType java setlocal omnifunc=javacomplete#Complete
	autocmd BufReadPost,BufWritePost *.java :NeomakeFile
augroup end
" I3WM --------------------------------------------------------------------------------------------
aug i3config_ft_detection
	au!
	au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
" buffers -----------------------------------------------------------------------------------------
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" ale ---------------------------------------------------------------------------------------------
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

let g:ale_fix_on_save = 1
let g:ale_completetion_enable = 0
" C/C++ -------------------------------------------------------------------------------------------
let g:ale_c_clangformat_options = '"-style={
			\ BasedOnStyle: google,
			\ IndentWidth: 2,
			\ColumnLimit: 100,
			\ AllowShortBlocksOnASingleLine: Always,
			\ AllowShortFunctionsOnASingleLine: Inline,
			\ FixNamespaceComments: true,
			\ ReflowComments: false,
			\ }"'
" Tab ---------------------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = '<c-n>'
" coc ---------------------------------------------------------------------------------------------
let g:coc_force_debug = 1
" coloresque --------------------------------------------------------------------------------------
let g:coloresque_whitelist = [
			\'css', 'haml', 'html', 'htmldjango', 'javascript', 'jsx', 'less', 'php',
			\'postcss', 'pug', 'qml', 'sass', 'scss', 'sh', 'stylus', 'svg', 'typescript',
			\'vim', 'vue', 'xml']

" -------------------------------------------------------------------------------------------------
" Themes ------------------------------------------------------------------------------------------
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'
packadd! sonokai
" colorscheme nord
" colorscheme dracula
colorscheme sonokai

if (has("nvim")) "Transparent background. Only for nvim
    highlight Normal guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
endi
