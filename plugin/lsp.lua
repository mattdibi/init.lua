local config = {
  signs = {
    text = {
       [vim.diagnostic.severity.ERROR] = "✖",
       [vim.diagnostic.severity.WARN] = "⚠",
       [vim.diagnostic.severity.HINT] = "➤",
       [vim.diagnostic.severity.INFO] = "ℹ",
    },
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "single",
    source = "always",
    header = "",
    prefix = "",
    suffix = "",
  },
}
vim.diagnostic.config(config)

-- Add LSP shortcut only when LSP attaches to the buffer
local lspattachgroup = vim.api.nvim_create_augroup('lspattachgroup', {})
vim.api.nvim_create_autocmd('LspAttach', {
    group = lspattachgroup,
    callback = function(e)
    local opts = { buffer = e.buf }

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader><C-k>", function() vim.lsp.buf.signature_help() end, opts)

    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)

    vim.keymap.set("n", "<leader>af", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>ar", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>=", function() vim.lsp.buf.format() end, opts)
    end
})
