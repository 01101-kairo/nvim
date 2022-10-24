local set = vim.opt
local g = vim.g
local key = vim.keymap.set
local fn = vim.fn.expand
local opts = { noremap = true, silent = true }
local toggle_modes = {'n', 't'}
local terminal = require("nvterm.terminal")

local ft_cmds = {
  python = "python3 " .. fn('%'),
  javascript = "node " .. fn('%'),
  c = "run " .. fn('%'),
  java = "run " .. fn('%'),
  html = "live-server $(pwd) ",
}

-- Plugins ====================================================================
require "plugins"
-- Settings ===================================================================
---------------------------------------------------------------------- Settings
vim.cmd[[
syntax on
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
set diffopt& diffopt+=algorithm:histogram,indent-heuristic
set is hls ic scs  " opções de busca
set nowrap  " linha longa
set encoding=utf8  " sou br é eu escrevo em portugues eu acho
]]

set.clipboard = 'unnamedplus' -- compartilhamento de área de trasferencia
set.history=500         -- 500 é um numero grande
set.smarttab=true
set.incsearch=true      -- isso aqui é pra 'pesquisa' ele completa palavras

set.guifont={"DejaVuSansMono Nerd Font","Mono:h12"}
set.termencoding='utf8' -- Yeah!! UTF-8 em tudo!
set.colorcolumn = '80'
set.tw=79
set.updatetime=300      -- mensagem de erro

set.laststatus = 3      -- global statusline
set.showmode = false

-- Indenting
set.smartindent=true    -- ativa autoindent da linguagens que eu tiver trabalhondo
-- vim.o.backspace = 2  -- para o backspace se comportar como a gente gosta
set.softtabstop= 2      -- numero de espaços que deve-se dar quando apertar o TAB
-- o python tem o tab de 4 spaces devido o coc
set.tabstop=2      -- show existing tab with 2 spaces width
set.shiftwidth=2   -- when indenting with '>', use 2 spaces width

set.expandtab=true -- On pressing tab, insert 4 spaces

set.fillchars = { eob = " " }
set.ignorecase = true
set.smartcase = true
set.mouse='a'   -- isso memo mouse no vim hooooo

-- Numbers
set.number=true -- só pra eu saber qual linha eu to
set.numberwidth = 2
set.ruler = false

-- disable nvim intro
set.shortmess:append "sI"

set.signcolumn = "yes"
set.splitbelow=true -- Create the horizontal splits below
set.splitright=true -- Create the vertical splits to the right
set.timeoutlen = 400
set.undofile = true

set.scrolloff=8
set.cmdheight=2
set.list = true
set.hidden=true
set.cindent=true    -- indentação no estilo C
set.cursorline=true -- ondiéqueeuto
set.sm=true -- mostra o início do bloco que acabou de ser fechado, sm é o mesmo que ShowMatch
set.ai=true -- auto indent
set.relativenumber=true -- numero relativo (esses numeros mudando)
set.autoread=true -- Update vim after file update from outside
set.title=true -- exibe alguma coisa na bara do terminal
set.autoindent=true -- aoutoindent
set.wildmenu=true -- menuzinho de completar comandos vim
set.confirm=true -- confirma exit
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
set.whichwrap:append "<>[]hl"

-- termguicolors
vim.cmd [[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set t_Co=256
  set termguicolors
endif
]]

-- Keymap =====================================================================
----------------------------------------------------------------------- Key Map
-- Coc keymap
vim.cmd [[inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]]
vim.cmd [[inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"]]
vim.cmd [[inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]]

local mappings = {
  { 'n', '<F5>', function () require("nvterm.terminal").send(ft_cmds[vim.bo.filetype]) end },
  { 'n', '<F7>', ':set foldmethod=indent<CR>', opts}, -- za desdobrar um por um, space tudo de uma vez
  { 'n', '<C-s>', ':w<CR>', opts}, -- save
  { 'n', '<C-q>', ':bp |bd #<CR>', opts}, -- quit
  { 'n', '<M-l>', ':bn<CR>', opts}, --navigate right
  { 'n', '<M-h>', ':bp<CR>', opts}, -- navigate left
  -- toggle
  { 'n', '<C-h>', ':CocCommand explorer<CR>', opts},
  { 'i', '<C-h>', '<ESC>:CocCommand explorer<CR>', opts},
  -- switch between windows
  -- { 'n', '<C-h>', '<C-w>h', opts},
  { 'n', '<C-l>', '<C-w>l', opts},
  { 'n', '<C-j>', '<C-w>j', opts},
  { 'n', '<C-k>', '<C-w>k', opts},

  -- terminal
  { toggle_modes, '<A-t>', function () terminal.toggle('horizontal') end },
  { toggle_modes, '<A-v>', function () terminal.toggle('vertical') end },
  { toggle_modes, '<A-i>', function () terminal.toggle('float') end },
}
for _, mapping in ipairs(mappings) do
  key(mapping[1], mapping[2], mapping[3], opts)
end

-- Settings plugs =============================================================
------------------------------------------------------------------------- Color
vim.cmd[[ let g:Hexokinase_highlighters = ['backgroundfull'] ]]

------------------------------------------------------------------------ theme onedark
require('onedark').setup  {
  -- Main options --
  style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = true,  -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = true, -- reverse item kind highlights in cmp menu

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

--------------------------------------------------------------------- ColorPars
require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    colors = {
      "#ff6188",
      "#ffb86c",
      "#50fa7b",
      "#56B6C2",
      "#61AFEF",
      "#ff79c6",
    },
    disable = { "html" },
  },
}

--------------------------------------------------------------------- highlight
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#ff6188 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#ffb86c gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#50fa7b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#ff79c6 gui=nocombine]]

vim.cmd [[hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#ffffff]]
vim.cmd [[let g:indentLine_fileTypeExclude = ['dashboard'] ]]

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

-------------------------------------------------------------------- Bufferline
require("bufferline").setup{}
diagnostics_indicator = function(count, level, diagnostics_dict, context)
  if context.buffer:current() then
    return ''
  end
  return ''
end

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

-------------------------------------------------------------------- Comentario
require('Comment').setup()
------------------------------------------------------------------------ Nvterm
require("nvterm").setup()
------------------------------------------------------------------------- Sitax
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

--------------------------------------------------------------------------- Ale
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

vim.cmd [[
" show number of errors
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? 'OK' : printf('%d⨉ %d⚠ ', all_non_errors, all_errors)
endfunction

set statusline+=%=
set statusline+=\ %{LinterStatus()}
]]

vim.cmd [[
let g:ale_linters = {'python': ['flake8', 'pylint'],'javascript': ['eslint'],'cpp':[],'c': [],}
]]

vim.cmd [[
let g:ale_fixers = {'*': ['trim_whitespace'],'cpp': ['clang-format'],'c': ['clang-format'],}
]]

vim.cmd [[
let g:ale_c_clangformat_options ='"-style={
  \ BasedOnStyle: google,
  \ IndentWidth: 2,
  \ ColumnLimit: 100,
  \ AllowShortBlocksOnASingleLine: Always,
  \ AllowShortFunctionsOnASingleLine: Inline,
  \ FixNamespaceComments: true,
  \ ReflowComments: false,
\ }"'
]]
