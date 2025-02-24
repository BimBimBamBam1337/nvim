return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },  -- plenuary.nvim — обязательный для null-ls
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- Форматирование и линтинг для Python
                    null_ls.builtins.formatting.black,      -- Форматирование Python
                    null_ls.builtins.diagnostics.flake8,    -- Линтер для Python

                    -- Форматирование и линтинг для Lua
                    null_ls.builtins.formatting.stylua,     -- Форматирование Lua
                    null_ls.builtins.diagnostics.luacheck,  -- Линтер для Lua
                },
            })
        end
    }
}
