-- Settings plugs =============================================================
--------------------------------------------------------------------- highlight
vim.cmd([[
highlight IndentBlanklineIndent1 guifg=#ff6188 gui=nocombine
highlight IndentBlanklineIndent2 guifg=#ffb86c gui=nocombine
highlight IndentBlanklineIndent3 guifg=#50fa7b gui=nocombine
highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine
highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine
highlight IndentBlanklineIndent6 guifg=#ff79c6 gui=nocombine

hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#ffffff
let g:indentLine_fileTypeExclude = ['dashboard']
]])

require("indent_blankline").setup({
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
})

