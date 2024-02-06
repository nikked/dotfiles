local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	"github/copilot.vim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"sindrets/diffview.nvim",
	"tpope/vim-commentary",
	"mg979/vim-visual-multi",

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-refactor",
		},
		build = ":TSUpdate",
		config = function()
			require("user.plugins.treesitter")
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lsp-colors.nvim",
			plu,
		},
		config = function()
			require("user.plugins.lspconfig")
		end,
	},

	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"hrsh7th/cmp-nvim-lsp-signature-help", -- Display func signature with current arg emphasized
			"onsails/lspkind-nvim", -- VSCode like pictograms
		},
		config = function()
			require("user.plugins.cmp")
		end,
	},

	-- Displays a popup with possible key bindings of the command you started typing
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup()
		end,
	},

	-- Linters, formatters, codeactions, diagnostics
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("user.plugins.null-ls")
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- Git
	{
		"tpope/vim-fugitive",
		cmd = "G",
	},

	{
		"lewis6991/gitsigns.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},

	-- Fuzzy finding
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	-- Status bar
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("user.plugins.lualine")
		end,
	},

	-- Vertical lines for indentation
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("user.plugins.indent-blankline")
		end,
	},

	-- File system explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("user.plugins.nvim-tree")
		end,
	},

	-- Colorschemes
	{ "bluz71/vim-moonfly-colors", name = "moonfly" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	"EdenEast/nightfox.nvim", -- terafox etc.
	{
		"ggandor/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},
})

-- Lazy loading does not work with some plugins
require("user.plugins.mason")
require("user.plugins.rust-tools")
require("user.plugins.catppuccin")
require("user.plugins.gitsigns")
require("user.plugins.telescope")
