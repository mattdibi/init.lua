return {
    {
        "rcasia/neotest-java",
        ft = "java",
        dependencies = {
            "mfussenegger/nvim-jdtls",
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-java")({
                        -- Optional configuration here
                        jvm_args = { "-Djunit.vintage.discovery.issue.reporting.enabled=false" }
                    }),
                },
                -- References https://symbl.cc/en/unicode-table/#geometric-shapes
                icons = {
                    child_indent = "│",
                    child_prefix = "├",
                    collapsed = "─",
                    file = "◯",
                    dir = "●",
                    expanded = "╮",
                    final_child_indent = " ",
                    final_child_prefix = "╰",
                    non_collapsible = "─",
                    notify = "!",
                    failed = "✖",
                    passed = "✔",
                    skipped = "▷",
                    running = "▶",
                    namespace = "▷",
                    test = "▷",
                    running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
                    unknown = "?",
                    watching = "0"
                }
            })

            -- Keymaps
            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true }

            -- Run nearest test
            keymap("n", "<leader>tt", function() require("neotest").run.run() end, opts)
            -- Run test file
            keymap("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, opts)
            -- Toggle test summary
            keymap("n", "<leader>ts", function() require("neotest").summary.toggle() end, opts)
            -- Show test output
            keymap("n", "<leader>to", function() require("neotest").output_panel.toggle() end, opts)
        end,
    },
}
