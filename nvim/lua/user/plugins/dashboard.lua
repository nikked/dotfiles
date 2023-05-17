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
				key = "fz",
			},
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Git files",
				group = "Label",
				action = "Telescope git_files",
				key = "ff",
			},
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Live grep",
				group = "Label",
				action = "Telescope live_grep",
				key = "fg",
			},
		},
	},
})
