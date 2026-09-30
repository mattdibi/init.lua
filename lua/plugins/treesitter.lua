return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
        -- Ensure java treesitter parser is installed if jdtls is advertised as installed
        -- Neotest-java relies on treesitter to discover tests
        if (os.getenv("INSTALLED_LSPS") or ""):find("jdtls", 1, true) ~= nil then
            require('nvim-treesitter').install { 'java' }
        end
    end
}
