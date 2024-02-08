-- Search
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<space>ff", builtin.git_files, { desc = "Search files in git directory" })
vim.keymap.set("n", "fz", builtin.find_files, {})
vim.keymap.set("n", "<space>fg", builtin.live_grep, { desc = "Live grep in current directory" })
vim.keymap.set("n", "prg", builtin.grep_string, { desc = "Grep word under cursor" })
vim.keymap.set("n", "<space>fb", builtin.buffers, { desc = "Search buffers" })
vim.keymap.set("n", "<space>fh", builtin.help_tags, { desc = "Search help tags" })
vim.keymap.set("n", "<space>fk", builtin.keymaps, { desc = "Search keymaps" })
vim.keymap.set("n", "<space>fq", builtin.quickfix, { desc = "Search items in quickfix list" })
vim.keymap.set("n", "<space>fs", builtin.lsp_document_symbols, { desc = "Search symbols in current file" })
vim.keymap.set("n", "<space>fS", builtin.lsp_workspace_symbols, { desc = "Search symbols in workspace" })
vim.keymap.set("n", "<space>fd", builtin.lsp_workspace_symbols, { desc = "Search symbols in workspace" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<space>vc", builtin.git_commits, { desc = "Check git commits" })
vim.keymap.set("n", "<space>vb", builtin.git_branches, { desc = "Check git branches" })
vim.keymap.set("n", "<space>vs", builtin.git_status, { desc = "Check git status" })
vim.keymap.set("n", "<space>vt", builtin.git_stash, { desc = "Check git stash" })

-- Move between the splits without using the mouse: split navigations
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", {})
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", {})
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", {})
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", {})

-- Resize panes
vim.keymap.set("n", "<C-S-J>", ":resize -2<CR>")
vim.keymap.set("n", "<C-S-K>", ":resize +2<CR>")
vim.keymap.set("n", "<C-S-L>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-S-H>", ":vertical resize +2<CR>")

-- Bind esc to jk
vim.api.nvim_set_keymap("i", "jk", "<Esc>", {})
vim.api.nvim_set_keymap("n", "jk", "<Esc>", {})

vim.api.nvim_set_keymap("n", "<F6>", ":setlocal spell! spelllang=en_us<CR>", {})

-- Close all tabs but current
-- I.e.: close all not in unsaved status and open most recent to editing
vim.api.nvim_set_keymap("n", "<space>c", ":%bd|e#<CR>", { desc = "Close all tabs but current" })

-- Close buffer without closing window
vim.cmd([[command! Bd bp | sp | bn | bd]])

-- Edit vim configuration file
vim.api.nvim_set_keymap("n", "confe", ":e ~/.config/nvim/lua/user/options.lua<CR>", {})

-- Reload vim configuration file
vim.api.nvim_set_keymap("n", "confr", ":source ~/.config/nvim/init.lua<CR>", {})

-- Open Nerd tree on tt
vim.keymap.set("n", "<space>tt", ":NvimTreeToggle<CR>", { desc = "Toggle NerdTree" })

-- -- Control buffers like tabs with CTRL+ N/P
vim.api.nvim_set_keymap("n", "<C-S-N>", ":bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-S-P>", ":bprev<CR>", { noremap = true })

-- Disable arrow keys
vim.api.nvim_set_keymap("n", "<Up>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Left>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", "<Nop>", { noremap = true })

-- Neo vim terminal settings
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Change colorscheme
vim.api.nvim_set_keymap("n", "<F5>", ":lua NextColor(1)<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F17>", ":lua NextColor(-1)<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-F5>", ":lua NextColor(-1)<CR>", { noremap = true })

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Paste replace visual selection without copying it
vim.keymap.set("v", "p", '"_dP')

-- Delete to the black hole register in visual mode
vim.keymap.set("v", "x", '"_x', { noremap = true })

-- move text up and down in visual mode
vim.keymap.set("x", "<s-j>", ":move '>+1<cr>gv-gv")
vim.keymap.set("x", "<S-k>", ":move '<-2<CR>gv-gv")
