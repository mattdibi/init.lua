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

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Add LSP shortcut only when LSP attaches to the buffer
local lspattachgroup = vim.api.nvim_create_augroup('lspattachgroup', {})
vim.api.nvim_create_autocmd('LspAttach', {
    group = lspattachgroup,
    callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "<leader><C-k>", function() vim.lsp.buf.signature_help() end, opts)

    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)

    vim.keymap.set("n", "<leader>af", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>ar", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>=",  function() vim.lsp.buf.format() end, opts)

    -- Clangd specific
    vim.api.nvim_create_user_command('A', 'LspClangdSwitchSourceHeader', {})
    vim.api.nvim_create_user_command('AV', 'vsplit | LspClangdSwitchSourceHeader', {})

    end
})

-- Servers
-- The configuration expects to find an env var 'INSTALLED_LSPS' which is
-- a comma-separated list of strings containing the installed LSPs on the
-- current machine. Given that this configuration is meant to be used with
-- devcontainers, we don't know beforehand what we can find in the environment
local installed_lsps = {}

local env_var = os.getenv('INSTALLED_LSPS')
if env_var ~= nil and env_var ~= '' then
    installed_lsps = vim.split(env_var, ',')
end

for k,v in ipairs(installed_lsps) do
    vim.lsp.enable(v)
end
