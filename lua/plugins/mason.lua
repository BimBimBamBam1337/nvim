return {
    -- Mason для управления LSP
    {
        "williamboman/mason.nvim",
        config = function()
            -- Инициализация Mason
            require("mason").setup()
        end,
    },

    -- --Mason + LSP
    -- {
    --     "williamboman/mason-lspconfig.nvim",
    --     dependencies = { "williamboman/mason.nvim" },
    --     config = function()
    --         -- Автоматическая установка и настройка LSP через Mason
    --         require("mason-lspconfig").setup({
    --             ensure_installed = {
    --                 "pyright",  -- LSP для Python
    --                 "dockerls", -- LSP для Docker
    --                 "jsonls",   -- LSP для JSON
    --                 "lua_ls",   -- LSP для Lua
    --                 "yamlls",   -- LSP для YAML
    --                 "marksman", -- LSP для Markdown
    --             },
    --         })
    --     end,
    -- },

    -- Конфигурация LSP
    {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- Capabilities for autocompletion
        local capabilities = cmp_nvim_lsp.default_capabilities()

        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "dockerls",
                "jsonls",
                "yamlls",
                "marksman",
            },

            -- Новый API вместо setup_handlers
            handlers = {
                function(server)
                    vim.lsp.config[server].setup({
                        capabilities = capabilities,
                    })
                end,
            },
            })
        end,
    }


}

