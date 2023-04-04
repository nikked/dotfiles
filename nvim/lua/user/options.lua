vim.opt.langmenu = "en_US"
vim.opt.encoding = "utf-8"
vim.opt.wildmenu = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.number = true -- absolute linenumber
vim.opt.relativenumber = true -- hybrid linenumber
vim.opt.compatible = false
vim.opt.mouse = "" -- Disable mouse support
vim.opt.clipboard = "unnamedplus" -- Copy to system clipboard
vim.opt.swapfile = false -- Disable swap files
vim.opt.laststatus = 3 -- Only have one global status bar
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Don't care about case if there is no capital letter
vim.opt.filetype = "off" -- Disable file type detection
vim.opt.cursorline = true -- Highlight current line

vim.cmd.colorscheme("catppuccin-macchiato")

vim.o.hidden = true

-- Auto-increase size of active window
vim.o.winwidth = 79

-- Open new split panes to right and bottom
vim.o.splitbelow = true
vim.o.splitright = true

-- Terraform stuff
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {
		"*.py",
		"*.rs",
		"*.lua",
		"*.sh",
		"*.html",
		"*.css",
		"*.json",
		"*.yaml",
		"*.yml",
		"*.toml",
		"*.md",
		"*.tf",
	},
	callback = function()
		vim.lsp.buf.format()
	end,
})
