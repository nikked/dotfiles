require("nvim-tree").setup({
	git = {
		ignore = false,
	},
	renderer = {
		highlight_opened_files = "all",
		group_empty = true,
		icons = {
			show = {
				folder_arrow = false,
			},
		},
		indent_markers = {
			enable = true,
		},
	},
})

vim.cmd([[
  highlight NvimTreeIndentMarker guifg=#30323E
  augroup NvimTreeHighlights
    autocmd ColorScheme * highlight NvimTreeIndentMarker guifg=#30323E
  augroup end
]])

vim.keymap.set("n", "<space>n", ":NvimTreeFindFileToggle<CR>")
