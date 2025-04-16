return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      filetypes = { "*" }, -- Включаем для всех типов файлов
      user_default_options = {
        RGB = true, -- Поддержка #RGB
        RRGGBB = true, -- Поддержка #RRGGBB
        names = true, -- Цвета по имени (например, "blue")
        RRGGBBAA = true, -- Поддержка #RRGGBBAA
        rgb_fn = true, -- Поддержка rgb(255, 0, 0)
        hsl_fn = true, -- Поддержка hsl(0, 100%, 50%)
        css = true, -- Включает все возможные CSS-цвета
        css_fn = true, -- Включает `rgb()` и `hsl()`
        mode = "foreground", -- Можно заменить на "background" для окраски фона
      },
    })
  end,
}

