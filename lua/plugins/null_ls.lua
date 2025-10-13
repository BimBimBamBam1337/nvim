return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    -- Подключаем нужные источники: форматтеры, линтеры, кодовые действия и т.д.
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,      -- для JS, TS, HTML, CSS и т.д.
        null_ls.builtins.formatting.black,         -- для Python
        null_ls.builtins.formatting.stylua,        -- для Lua

        null_ls.builtins.diagnostics.eslint,       -- для JS/TS
        null_ls.builtins.diagnostics.flake8,       -- для Python

        null_ls.builtins.code_actions.gitsigns,    -- действия по git

        -- null_ls.builtins.formatting.your_custom_tool.with({ ... })
      },
      -- Настройки LSP-клиента none-ls
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}

