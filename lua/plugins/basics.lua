return {
    "ntpeters/vim-better-whitespace",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "tpope/vim-commentary",
    "neovim/nvim-lspconfig",
    {
        "mfussenegger/nvim-jdtls",
        -- Enabled only if jdtls is installed
        enabled = (os.getenv("INSTALLED_LSPS") or ""):find("jdtls", 1, true) ~= nil,
    },
}
