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

---------------------------------------------------------------------- plugin's
local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager
    use 'navarasu/onedark.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'kyazdani42/nvim-web-devicons'
    use 'norcalli/nvim-colorizer.lua'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate' }
    use {
        'mg979/vim-visual-multi',
        branch = 'master'
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'neoclide/coc.nvim',
        branch = 'release'
    }
    use 'AndrewRadev/tagalong.vim'

    -- live-server
    use 'manzeloth/live-server'
    use{
        'turbio/bracey.vim',
        -- fazer o run manualmente na pasta
        -- $HOME/.local/share/nvim/site/pack/packer/start/bracey.vim/
        run = 'npm install --prefix server',
    }
    use 'dense-analysis/ale'

    -- install without yarn or npm
    use{
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
    }

    use{
        'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install',
        setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
        ft = { 'markdown' },
    }
end)

----------------------------------------------------------------------- Key Map
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
cmd [[inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]]
cmd [[inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"]]
cmd [[inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]]

-------------------------------------------------------------------------- ale
g['ale_echo_msg_error_str'] = 'E'
g['ale_echo_msg_warning_str'] = 'W'
g['ale_echo_msg_format'] = '[%linter%] %s [%severity%]'
g['ale_fix_on_save'] = 1
g['ale_completetion_enable'] = 0
g['neocomplete#enable_at_startup'] = 1
g['rainbow_active']= 1
-- don't check syntax immediately on open or on quit
g['ale_lint_on_enter'] = 0
g['ale_lint_on_save'] = 1

-- error symbol to use in sidebar
g['ale_sign_error'] = '✗'
g['ale_sign_warning'] = '⚠'

cmd [[
" show number of errors
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

]]

cmd [[
    let g:ale_linters = {
        \'python': ['flake8', 'pylint'],
        \'javascript': ['eslint'],
        \'cpp':[],
        \'c': [],
    \}
]]

cmd [[
    let g:ale_fixers = {
       \'*': ['trim_whitespace'],
       \'cpp': ['clang-format'],
       \'c': ['clang-format'],
    \}
]]

cmd [[
    let g:ale_c_clangformat_options = '"-style={
        \ BasedOnStyle: google,
        \ IndentWidth: 4,
        \ ColumnLimit: 100,
        \ AllowShortBlocksOnASingleLine: Always,
        \ AllowShortFunctionsOnASingleLine: Inline,
        \ FixNamespaceComments: true,
        \ ReflowComments: false,
    \ }"'
]]

------------------------------------------------------------------------ Themes
-- termguicolors
cmd [[
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set t_Co=256
        set termguicolors
    endif
]]

-- theme onedark
require('onedark').setup  {
    -- Main options --
    style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
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
-- colorscheme sonokai
cmd [[
    if (has("nvim")) "Transparent background. Only for nvim
        highlight Normal guibg=NONE ctermbg=NONE
        highlight EndOfBuffer guibg=NONE ctermbg=NONE
    endif
]]
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
require('colorizer').setup()
----------------------------------------------------------------------- lualine
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {'branch',icon = '',color = { fg = '#f6f6f6'},},
            {'diff', symbols = {added = '+', modified = '~', removed = '-'},},
            {'diagnostics',sources = { 'ale' },
            symbols = { error = '✗ ', warn = '⚠ ', info = ' ' },
            }
        },
    lualine_c = {'filename',},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
tabline = {},
winbar = {},
inactive_winbar = {},
extensions = {}
}
-------------------------------------------------------------------- bufferline
require("bufferline").setup{}
diagnostics_indicator = function(count, level, diagnostics_dict, context)
  if context.buffer:current() then
    return ''
  end
  return ''
end
-------------------------------------------------------------------- comentario
require('Comment').setup()
------------------------------------------------------------------------- sitax
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "cpp", "java", "bash", "fish", "javascript", "html", "css" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
  },

  additional_vim_regex_highlighting = false,
}
