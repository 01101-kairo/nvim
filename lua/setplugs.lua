local g = vim.g
------------------------------------------------------------------------ Themes
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
--------------------------------------------------------------------- highlight
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#FF6188 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#ffb86c gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#50fa7b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#ff79c6 gui=nocombine]]

vim.cmd [[hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFFFF]]
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

vim.cmd [[
" show number of errors
function! LinterStatus() abort
let l:counts = ale#statusline#Count(bufnr(''))
let l:all_errors = l:counts.error + l:counts.style_error
let l:all_non_errors = l:counts.total - l:all_errors
return l:counts.total == 0 ? 'OK' : printf('%d⨉ %d⚠ ', all_non_errors, all_errors)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()} ]]

vim.cmd [[
let g:ale_linters = {
  \'python': ['flake8', 'pylint'],
  \'javascript': ['eslint'],
  \'cpp':[],
  \'c': [],
  \} ]]

vim.cmd [[
let g:ale_fixers = {
  \'*': ['trim_whitespace'],
  \'cpp': ['clang-format'],
  \'c': ['clang-format'],
  \} ]]

vim.cmd [[
let g:ale_c_clangformat_options = '"-style={
  \ BasedOnStyle: google,
  \ IndentWidth: 2,
  \ ColumnLimit: 100,
  \ AllowShortBlocksOnASingleLine: Always,
  \ AllowShortFunctionsOnASingleLine: Inline,
  \ FixNamespaceComments: true,
  \ ReflowComments: false,
  \ }"' ]]

-- termguicolors
vim.cmd [[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set t_Co=256
  set termguicolors
  endif ]]

vim.cmd [[
if (has("nvim")) "Transparent background. Only for nvim
  highlight Normal guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  endif ]]
