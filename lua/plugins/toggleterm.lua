return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        auto_scroll = true,
        autochdir = true,
        shell = "/usr/bin/zsh",
        start_in_insert = false,
        size = 20,  -- высота терминала
        width = 80, -- ширина терминала
        direction = "float",  -- терминал как плавающее окно
        highlights = {
          Normal = { guibg = "#1e1e1e" },
          NormalNC = { guibg = "#2e2e2e" },
        },
        history_size = 1000,
        persist_size = true,
        float_opts = {
          border = "rounded", -- рамка терминала
          winblend = 3,       -- прозрачность
        },
        close_on_exit = false, -- Терминал остаётся запущенным после выхода
        -- Включение Visual и Normal режима
        insert_mappings = true, -- включение хоткеев в Insert-режиме
        terminal_mappings = true, -- использование хоткеев toggleterm
      })
    end,
  },
}

