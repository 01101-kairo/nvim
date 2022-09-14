-------------------------------------------------------------------------------
local g = vim.g
local o = vim.o
local api = vim.api
local opt = vim.opt
local cmd = vim.cmd
local command = api.nvim_command
local keymap = vim.api.nvim_set_keymap
local ns = {noremap=true, silent=true}

-------------------------------------------------------------- set nocompatible
command("syntax on")
command("filetype on")
command("filetype plugin on")
command("filetype indent on")
command("filetype plugin indent on")
command("set diffopt& diffopt+=algorithm:histogram,indent-heuristic")
command("set signcolumn=yes")
command("set is hls ic scs")-- opções de busca
command("set nocompatible")	-- be improved, required
command("set nowrap")		-- linha longa
command("set bs=2")			-- para o backspace se comportar como a gente gosta
command("set t_Co=256")		-- real ñ sei pq isso mas eu gosto de me previnir com relação a cores
command("set encoding=utf8")-- sou br é eu escrevo em portugues eu acho

o.clipboard = 'unnamedplus'	-- compartilhamento de área de trasferencia
o.history=500				-- 500 é um numero grande
o.ignorecase=true
o.smartcase=true
o.smarttab=true
o.incsearch=true			-- isso aqui é pra 'pesquisa' ele completa palavras
o.tabstop=4			    	-- numero de espações que deve-se voltando quando apertar o backspace num tab

opt.guifont={"DejaVuSansMono Nerd Font","Mono:h12"}
opt.termencoding='utf8'		-- Yeah!! UTF-8 em tudo!
opt.mouse='a'				-- isso memo mouse no vim hooooo
opt.colorcolumn = '80'
opt.tw=79
opt.updatetime=300			-- mensagem de erro
opt.shiftwidth=4			-- numero de espaço usado quando rolar o autoindent
opt.softtabstop=4			-- numero de espaços que deve-se dar quando apertar o TAB
opt.scrolloff=8
opt.cmdheight=2
opt.termguicolors=true
opt.list = true
opt.listchars:append "eol:↴"
opt.hidden=true
opt.expandtab=true
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
keymap("n","<F5>",":call Run(shellescape(@%, 1))<CR>",ns)
keymap("n","<F7>",":set foldmethod=indent<CR>",ns) -- za desdobrar um por um, space tudo de uma vez
keymap("n","<C-s>",":w<CR>",ns)
keymap("n","<C-h>",":CocCommand explorer<CR>",ns)
keymap("n","<C-q>",":bp |bd #<CR>",ns)
keymap("n","<M-l>",":bn<CR>",ns)
keymap("n","<M-h>",":bp<CR>",ns)
keymap("n","<C-j>","<C-w>j",ns)
keymap("n","<C-k>","<C-w>k",ns)
keymap("n","<C-l>","<C-w>l",ns)

--------------------------------------------------------------------------- Coc
cmd([[inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]])
cmd([[inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"]])
cmd([[inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]])

-------------------------------------------------------------------------- ale
cmd([[
    let g:ale_linters = {
        \'python': ['flake8', 'pylint'],
        \'javascript': ['eslint'],
        \'cpp':[],
        \'c': [],
    \}
]])

cmd([[
    let g:ale_fixers = {
       \'*': ['trim_whitespace'],
       \'cpp': ['clang-format'],
       \'c': ['clang-format'],
    \}
]])

cmd([[
    let g:ale_c_clangformat_options = '"-style={
        \ BasedOnStyle: google,
        \ IndentWidth: 4,
        \ ColumnLimit: 100,
        \ AllowShortBlocksOnASingleLine: Always,
        \ AllowShortFunctionsOnASingleLine: Inline,
        \ FixNamespaceComments: true,
        \ ReflowComments: false,
    \ }"'
]])

g['ale_fix_on_save'] = 1
g['ale_completetion_enable'] = 0
g['neocomplete#enable_at_startup'] = 1
g['rainbow_active']= 1

------------------------------------------------------------------------ Themes
-- termguicolors
cmd([[
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
]])

-- theme onedark
require('onedark').setup  {
    -- Main options --
    style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = true,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

}
require('onedark').load()
--------------------------------------------------------------------- highlight
cmd [[highlight IndentBlanklineIndent1 guifg=#FF6188 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent2 guifg=#ffb86c gui=nocombine]]
cmd [[highlight IndentBlanklineIndent3 guifg=#50fa7b gui=nocombine]]
cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
cmd [[highlight IndentBlanklineIndent6 guifg=#ff79c6 gui=nocombine]]

cmd([[
    hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFFFF
    let g:indentLine_fileTypeExclude = ['dashboard']
]])

require("indent_blankline").setup {
    show_end_of_line = true,
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

-------------------------------------------------------------- PARA O COLORIZER
require'colorizer'.setup()
----------------------------------------------------------------------- lualine
require('lualine').setup()
-------------------------------------------------------------------- bufferline
require'bufferline'.setup{}
diagnostics_indicator = function(count, level, diagnostics_dict, context)
  if context.buffer:current() then
    return ''
  end
  return ''
end
----------------------------------------------------------------------- Run COD
cmd([[
    function! Run(arq)
        :w
        if &filetype == 'html'
            :Bracey
        elseif &filetype == 'Java'
            :!javac '%' -d /tmp/ && java /tmp/'%'
        elseif &filetype == 'markdown'
            :exec '!glow' a:arq
        elseif &filetype == 'python'
            :exec '!python3' a:arq
        elseif &filetype == 'c'
            :exec '!clang -o /tmp/a.out' a:arq ';/tmp/a.out'
        endif
    endfunctio
]])

-------------------------------------------------------------------------------
