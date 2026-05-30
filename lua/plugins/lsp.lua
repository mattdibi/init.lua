return {
    "neovim/nvim-lspconfig",
    config = function()
        -- Mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        local opts = { noremap=true, silent=true }
        vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

        -- -- nvim-cmp configuration
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        vim.lsp.enable('clangd')
    end
}
