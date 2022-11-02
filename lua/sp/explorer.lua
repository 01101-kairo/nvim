-- Settings plugs =============================================================
---------------------------------------------------------------------- Explorer
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
