-- Setup language servers.
local util = require 'lspconfig.util'

vim.lsp.config('pyright', {})
vim.lsp.config('terraformls', {})
vim.lsp.config('tailwindcss', {})
vim.lsp.config('sqlls', {})






vim.lsp.config('ruff', {})


vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },
  -- capabilities = capabilities, -- uncomment if needed
  on_attach = function(client, bufnr)
    -- Example: format on save if you want
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    print('TypeScript LSP attached to buffer ' .. bufnr)
  end,
})

-- vim.lsp.config('eslint', {
--   cmd = { 'vscode-eslint-language-server', '--stdio' },
--   filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
--   root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.json', 'package.json' },
--   -- capabilities = capabilities, -- uncomment if you have cmp_nvim_lsp
--   on_attach = function(_, bufnr)
--     -- Run ESLint fix before saving
--     vim.api.nvim_create_autocmd('BufWritePre', {
--       buffer = bufnr,
--       command = 'EslintFixAll',
--     })
--   end,
-- })

vim.lsp.config('eslint', {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { '.eslintrc', 'package.json' },
  settings = { run = 'onSave' },

})





-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Show diagnostics in float" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Set diagnostics to loclist" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Jump to declaration", unpack(opts) })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Jump to definition", unpack(opts) })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover", unpack(opts) })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Jump to implementation", unpack(opts) })
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "Show signature help", unpack(opts) })
    vim.keymap.set(
      "n",
      "<space>wa",
      vim.lsp.buf.add_workspace_folder,
      { desc = "Add workspace folder", unpack(opts) }
    )
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { desc = "Jump to type definition", unpack(opts) })
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename symbol", unpack(opts) })
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code action", unpack(opts) })
    vim.keymap.set("n", "<space>cff", vim.lsp.buf.format, { desc = "Quick format", unpack(opts) })
    vim.keymap.set(
      "n",
      "gr",
      ":Telescope lsp_references<CR>",
      { buffer = bufnr, desc = "Find references", unpack(opts) }
    )
    vim.keymap.set("n", "<space>b", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format buffer", unpack(opts) })
    vim.keymap.set(
      "n",
      "<space>wr",
      vim.lsp.buf.remove_workspace_folder,
      { desc = "Remove workspace folder", unpack(opts) }
    )
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = "List workspace folders", unpack(opts) })
  end,
})
