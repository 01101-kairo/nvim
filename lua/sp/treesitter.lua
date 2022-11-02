-- Settings plugs =============================================================
-------------------------------------------------------------------  Treesitter
require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "bash", "css", "html", "javascript", "c", "cpp", "lua", "java" },

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
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = { -- table of hex strings
			"#ffb86c",
			"#ff6188",
			"#50fa7b",
			"#56B6C2",
			"#61AFEF",
			"#ff79c6",
		},
    -- termcolors = {} -- table of colour name strings
		disable = { "html" },
	},
})
