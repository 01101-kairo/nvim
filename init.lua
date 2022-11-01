-- Settings ===================================================================
---------------------------------------------------------------------- Settings
local set = vim.opt

set.clipboard = 'unnamedplus'-- compartilhamento de área de trasferencia
set.history=500              -- 500 é um numero grande
set.smarttab=true
set.incsearch=true           -- isso aqui é pra 'pesquisa' ele completa palavras

-- set.guifont={"DejaVuSansMono Nerd Font","Mono:h12"}
set.termencoding='utf8' -- Yeah!! UTF-8 em tudo!
set.colorcolumn = '80'
set.tw=79
set.updatetime=300      -- mensagem de erro

set.laststatus = 3      -- global statusline
set.showmode = false

-- Indenting
set.smartindent=true -- ativa autoindent da linguagens que eu tiver trabalhondo
set.softtabstop= 2   -- numero de espaços que deve-se dar quando apertar o TAB
set.tabstop=2        -- show existing tab with 2 spaces width
set.shiftwidth=2     -- when indenting with '>', use 2 spaces width

set.expandtab=true   -- On pressing tab, insert 4 spaces

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
set.splitbelow=true  -- Create the horizontal splits below
set.splitright=true  -- Create the vertical splits to the right
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
set.whichwrap:append "<>[]hl" -- when cursor reaches end/beginning of line
set.wrap = false -- linha longa

-- Keymap =====================================================================
----------------------------------------------------------------------- Key Map
local map = vim.keymap.set

-- Coc keymap
-- local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- map("i", "<TAB>", [[coc#pum#visible() ? coc#pum#next(1) : "<TAB>"]], opts)
-- map("i", "<M-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], opts)
vim.cmd[[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <cr> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<cr>'
smap <silent><expr> <cr> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<cr>'
]]
local nl = { noremap = true, silent = true }
local toggle_modes = {'n', 't'}
local terminal = require("nvterm.terminal")
local fn = vim.fn.expand
local ft_cmds = {
  c = "run " .. fn('%'),
  javascript = "node " .. fn('%'),
  html = "live-server $(pwd) ",
  css = "live-server $(pwd) ",
  python = "python3 " .. fn('%'),
  java = "run " .. fn('%'),
}

local mappings = {
  -- Explorer
  { 'n', '<C-h>', ':NvimTreeToggle <CR>', nl},
  { 'i', '<C-h>', '<ESC>:NvimTreeToggle<CR>', nl},
  -- Terminal
  { toggle_modes, '<A-t>', function () terminal.toggle('horizontal') end },
  { toggle_modes, '<A-v>', function () terminal.toggle('vertical') end },
  { toggle_modes, '<A-i>', function () terminal.toggle('float') end },
  { 'n', '<F5>', function () terminal.send(ft_cmds[vim.bo.filetype]) end },
  -- za desdobrar um por um, space tudo de uma vez
  { 'n', '<F7>', ':set foldmethod=indent<CR>', nl},
  -- Save
  { 'n', '<C-s>', ':w<CR>', nl},
  -- quit
  { 'n', '<C-q>', ':bp |bd #<CR>', nl},
  -- Navigate
  { 'n', '<A-l>', ':bn<CR>', nl},
  { 'n', '<A-h>', ':bp<CR>', nl},
  { 'n', '<A-Right>', ':bn<CR>', nl},
  { 'n', '<A-Left>', ':bp<CR>', nl},
  -- switch between windows
  -- { 'n', '<C-h>', '<C-w>h', nl},
  { 'n', '<C-l>', '<C-w>l', nl},
  { 'n', '<C-j>', '<C-w>j', nl},
  { 'n', '<C-k>', '<C-w>k', nl},
}

for _, mapping in ipairs(mappings) do
  map(mapping[1], mapping[2], mapping[3], nl)
end

-- Plugins ====================================================================
require "plugins"
-- Settings plugs =============================================================
------------------------------------------------------------------------- Color
vim.cmd[[
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = ['full_hex','triple_hex','rgb','rgba','hsl','hsla','colour_names']
]]

------------------------------------------------------------------------ theme onedark
-- termguicolors
vim.cmd [[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set t_Co=256
  set termguicolors
endif
]]

require('onedark').setup  {
  -- Main options --
  style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false,  -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
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
--------------------------------------------------------------------- ColorPars
require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    colors = {
      "#ffb86c",
      "#ff6188",
      "#50fa7b",
      "#56B6C2",
      "#61AFEF",
      "#ff79c6",
    },
    disable = { "html" },
  },
}

--------------------------------------------------------------------- highlight
vim.cmd [[
highlight IndentBlanklineIndent1 guifg=#ff6188 gui=nocombine
highlight IndentBlanklineIndent2 guifg=#ffb86c gui=nocombine
highlight IndentBlanklineIndent3 guifg=#50fa7b gui=nocombine
highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine
highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine
highlight IndentBlanklineIndent6 guifg=#ff79c6 gui=nocombine

hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#ffffff
let g:indentLine_fileTypeExclude = ['dashboard']
]]

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
require("bufferline").setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,

    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    buffer_close_icon = '',
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = false, -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
}
----------------------------------------------------------------------- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme =  'auto',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
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
      {'diagnostics',sources = {'nvim_lsp'},
        symbols = { error = " ", warn = " ", info = " ", hint = " "},
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
------------------------------------------------------------------------- Sitax
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "css", "html", "javascript",  "c", "cpp", "lua", "java" },

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

-------------------------------------------------------------------- Comentario
require('Comment').setup()
------------------------------------------------------------------------ Nvterm
require("nvterm").setup()
---------------------------------------------------------------------- Examples
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  filters = {
    dotfiles = true,
  },

  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
    hide_root_folder = true,
  },

  log = {
    enable = true,
    truncate = true,
    types = {
      diagnostics = true,
      git = true,
      profile = true,
      watcher = true,
    },
  },

  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },

        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
})

------------------------------------------------------------------------- Pears
require "pears".setup()
--------------------------------------------------------------------------PKind
local lspkind = require('lspkind')

lspkind.init({
  -- with_text = true,
  mode = 'symbol_text',
  preset = 'codicons',
  symbol_map = {
    Text        =  "",
    Method      =  "ƒ",
    Function    =  "",
    Constructor =  "",
    Field       =  "",
    Variable    =  "",
    Class       =  "",
    Interface   =  "",
    Module      =  "",
    Property    =  "",
    Unit        =  "",
    Value       =  "",
    Enum        =  "",
    Keyword     =  "",
    Snippet     =  "",
    Color       =  "",
    File        =  "",
    Reference   =  "",
    Folder      =  "",
    EnumMember  =  "",
    Constant    =  "",
    Struct      =  "",
    Event       =  "",
    Operator    =  "",
    TypeParameter = "<>",
  },
})

--------------------------------------------------------------------------- CMP
vim.o.completeopt = "menu,menuone,noselect"
require('luasnip.loaders.from_vscode').lazy_load()
-- Set up nvim-cmp.
local cmp = require'cmp'
local luasnip = require('luasnip')
local select_opts = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
       luasnip.lsp_expand(args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },

  window = {
      -- documentation = cmp.config.window.bordered()
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    completion = {
      -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    (" .. strings[2] .. ")"

      return kind
    end,
  },
 -- formatting = {
 --    format = lspkind.cmp_format({
 --      -- Don't write the type of completion, just show the icon
 --     with_text = false,
 --     maxwidth = 50,
 --      -- Show the completion source
 --     menu = {
 --       buffer = '[BUF]',
 --       nvim_lsp = '[LSP]',
 --       nvim_lua = '[API]',
 --       path = '[PATH]',
 --       luasnip = '[SNIP]',
 --     },
 --   })
 -- },

  mapping = cmp.mapping.preset.insert({
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<A-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'friendly-snippets'},
    { name = 'vim-react-snippets'}, -- For React
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
      { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
      { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    })
})

------------------------------------------------------ LSPs with default setup:
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local servers = {
  'bashls',-- bashls (Bash)
  'cssls', -- cssls (CSS)
  'emmet-ls', -- emmet_ls (HTML)
  'html', -- html (HTML)
  'clangd', -- clangd (C/C++)
  'jsonls',-- jsonls (JSON)
  'eslint',-- eslint (JS)
  'tsserver',-- tsserver (Typescript)
  'pyright',-- pyright (Python)
  'sumneko_lua',-- sumneko_lua (Lua)
  'jdtls' -- jdtls (Java)
}

for _, lsp in ipairs(servers)  do
  lspconfig[lsp].setup {
    -- on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})

capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Diagnostics symbols for display in the sign column.
local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')
