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
        dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/nvim-cmp" },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- Получаем capabilities для автодополнения
            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- Настройка каждого LSP-сервера с автодополнением
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.dockerls.setup({
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
            })
            lspconfig.marksman.setup({
                capabilities = capabilities,
            })
        end,
    },
}

