--| Settings plugs |============================================================
-------------------------------------------------------------------  Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash", "css", "html", "javascript", "c", "cpp", "lua", "java" },
  sync_install = false,
  highlight = {
    enable = true,
    disable = { "markdown", "html" },
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- Setting colors
    colors = {
      "#ffb86c",
      "#ff6188",
      "#50fa7b",
      "#56B6C2",
      "#61AFEF",
      "#ff79c6",
    },disable = { "html" }, -- list of languages you want to disable the plugin for
  },
}
