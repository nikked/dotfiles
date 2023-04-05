-- Install packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Initialize packer
require("packer").init({
	compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "solid" })
		end,
	},
})

-- Install plugins
local use = require("packer").use

-- Packer can manage itself
use("wbthomason/packer.nvim")

use("github/copilot.vim")

-- LSP
use({
	"neovim/nvim-lspconfig",
	requires = {
		"folke/lsp-colors.nvim",
		plu,
	},
	config = function()
		require("user.plugins.lspconfig")
	end,
})

use({
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
})

use({
	"weilbith/nvim-code-action-menu",
	cmd = "CodeActionMenu",
})

use({
	"hrsh7th/nvim-cmp",
	requires = {
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
})

-- Displays a popup with possible key bindings of the command you started typing
use({
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup({})
	end,
})

-- Rename in a popup window
-- use({
-- 	"hood/popui.nvim",
-- 	requires = "RishabhRD/popfix",
-- 	config = function()
-- 		vim.ui.select = require("popui.ui-overrider")
-- 		vim.ui.input = require("popui.input-overrider")
-- 	end,
-- })

use({
	"simrat39/rust-tools.nvim",
})

-- Linters, formatters, codeactions, diagnostics
use({
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		require("user.plugins.null-ls")
	end,
})

use({
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	requires = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-refactor",
	},
	config = function()
		require("user.plugins.treesitter")
	end,
})

use({
	"kylechui/nvim-surround",
	tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
})

-- Git
use({
	"tpope/vim-fugitive",
	cmd = "G",
})

use({
	"lewis6991/gitsigns.nvim",
	requires = "nvim-lua/plenary.nvim",
})

-- Fuzzy finding
use({
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	requires = { { "nvim-lua/plenary.nvim" } },
})

-- Code Commenting
use("tpope/vim-commentary")

-- Status bar
use({
	"nvim-lualine/lualine.nvim",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("user.plugins.lualine")
	end,
})

-- Vertical lines for indentation
use({
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("user.plugins.indent-blankline")
	end,
})

-- File system explorer
use({
	"kyazdani42/nvim-tree.lua",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("user.plugins.nvim-tree")
	end,
})

-- Colorschemes
use({ "bluz71/vim-moonfly-colors", as = "moonfly" })
use({
	"catppuccin/nvim",
	as = "catppuccin",
})
use("EdenEast/nightfox.nvim") -- terafox etc.

-- Cache dependencies for faster startup
use("lewis6991/impatient.nvim")

-- use({
-- 	"glacambre/firenvim",
-- 	run = function()
-- 		vim.fn["firenvim#install"](0)
-- 	end,
-- })

-- Automatically install plugins on first run
if packer_bootstrap then
	require("packer").sync()
end

-- Automatically regenerate compiled loader file on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

-- Lazy loading does not work with some plugins
require("user.plugins.mason")
require("user.plugins.rust-tools")
require("user.plugins.catppuccin")
require("user.plugins.gitsigns")
require("user.plugins.telescope")
