require("dashboard").setup({
	theme = "hyper",
	hide = {
		statusline = false,
	},
	config = {
		header = {},
		footer = {},
		shortcut = {
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Git files",
				group = "Label",
				action = "Telescope git_files",
				key = "g",
			},
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Live grep",
				group = "Label",
				action = "Telescope live_grep",
				key = "r",
			},
		},
	},
})
