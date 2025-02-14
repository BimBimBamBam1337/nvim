return {
    -- Установка и настройка mason.nvim
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },

    -- mason-lspconfig для интеграции с LSP-серверами
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright", "dockerls", "jsonls", "lua_ls", "yamlls", "marksman",
                }, -- Список LSP-серверов для автоматической установки
                automatic_installation = true,
            })
        end,
    },

    -- Конфигурация LSP через nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Добавляем поддержку snippet'ов для HTML и других серверов
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- Настройка LSP сервера для Python (pyright)
            lspconfig.pyright.setup({
                capabilities = capabilities,
                cmd = { "/home/alohadance1337/.local/share/nvim/mason/bin/pyright-langserver", "--stdio" }
            })

            -- Настройка LSP для Docker (dockerls)
            lspconfig.dockerls.setup({
                capabilities = capabilities,
            })

            -- Настройка LSP для JSON (jsonls)
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })

            -- Настройка LSP для Lua (lua_ls)
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            -- Настройка LSP для YAML (yamlls)
            lspconfig.yamlls.setup({
                capabilities = capabilities,
            })

        end,
    }
    ,

    -- Настройка mason-null-ls для установки дополнительных инструментов форматирования и линтинга
    {
        "jayp0521/mason-null-ls.nvim",
        dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "black",   -- Форматирование Python
                    "flake8",  -- Линтер для Python
                    "stylua",  -- Форматирование Lua
                    "luacheck" -- Линтер для Lua
                },
                automatic_installation = true,
            })

            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- Python
                    null_ls.builtins.formatting.black,    -- Форматирование
                    null_ls.builtins.diagnostics.flake8,  -- Линтер

                    -- Lua
                    null_ls.builtins.formatting.stylua,   -- Форматирование
                    null_ls.builtins.diagnostics.luacheck -- Линтер
                },
            })
        end,
    },

    -- Настройка mason-dap для установки DAP-серверов
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            -- DAP для Python
            dap.adapters.python = {
                type = "executable",
                command = "python",
                args = { "-m", "debugpy.adapter" },
            }

            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                },
            }

            -- DAP для Lua
            dap.adapters.lua = {
                type = "executable",
                command = "vscode-lldb",
            }

            dap.configurations.lua = {
                {
                    type = "lua",
                    request = "launch",
                    name = "Launch Lua File",
                    program = "${file}",
                },
            }
        end,
    },
}

