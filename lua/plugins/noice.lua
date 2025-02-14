
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      -- Отключаем стандартные сообщения Neovim
      messages = {
        enabled = true,
        view = "notify", -- Используем notify для сообщений
      },
      -- Настройка командной строки
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },
      -- Настройка всплывающих окон
      views = {
        cmdline_popup = {
          position = {
            row = "50%", -- Центрируем по вертикали
            col = "50%", -- Центрируем по горизонтали
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        notify = {
          backend = "notify",
          format = "details",
        },
      },
      -- Настройка окон уведомлений
      routes = {
        {
          filter = {
            event = "msg_showmode",
          },
          opts = { skip = true }, -- Отключаем сообщения о режимах
        },
      },
    })
  end,
}

