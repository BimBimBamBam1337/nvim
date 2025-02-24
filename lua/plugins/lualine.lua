
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Кастомная цветовая схема
    local custom_theme = {
      normal = { c = { fg = "#906aff", bg = "#1a1a1a" } },
      insert = { c = { fg = "#906aff", bg = "#00FFD1" } },
      visual = { c = { fg = "#906aff", bg = "#684ca4" } },
      replace = { c = { fg = "#906aff", bg = "#d75f5f" } },
      command = { c = { fg = "#906aff", bg = "#ffd700" } },
      inactive = { c = { fg = "#5f5f5f", bg = "#1A1A1A" } },
    }

    -- Добавляем карты цветов для каждого режима
    vim.cmd [[
      highlight NormalMode guifg=#906aff guibg=#1A1A1A
      highlight InsertMode guifg=#906aff guibg=#00FFD1
      highlight VisualMode guifg=#906aff guibg=#684CA4
      highlight ReplaceMode guifg=#906aff guibg=#D75F5F
      highlight CommandMode guifg=#906aff guibg=#FFD700
      highlight InactiveMode guifg=#5F5F5F guibg=#1A1A1A
    ]]

    -- Создание карты режимов с эмодзи и цветами
    local mode_map = {
      ["NORMAL"] = "%#NormalMode#󰹑 ",
      ["INSERT"] = "%#InsertMode#󰲔 ",
      ["VISUAL"] = "%#VisualMode#󰘖 ",
      ["V-LINE"] = "%#VisualMode#󰘖 ",
      ["V-BLOCK"] = "%#VisualMode#󰘖 ",
      ["REPLACE"] = "%#ReplaceMode#󰲞 ",
      ["COMMAND"] = "%#CommandMode#󰌌 ",
      ["TERMINAL"] = "%#NormalMode# ",
      ["t"] = "%#NormalMode# ", -- альтернатива для терминала
    }

    -- Настройка lualine
    require("lualine").setup({
      options = {
        theme = custom_theme,
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return mode_map[str] or str
            end
          }
        },
        lualine_b = {
          { "branch", color = { fg = "#906aff" } },
          { "diff", color = { fg = "#906aff" } },
          { "diagnostics", color = { fg = "#906aff" } },
          {
            "progress",
            color = { fg = "#906aff" }, -- Прогресс в том же цвете
            fmt = function(str) 
              return "%#NormalMode#" .. str  -- Применить цвет из темы
            end
          }
        },
        lualine_c = {
          {
            "filename",
            icon = "",
            color = { fg = "#00FFD1" }
          },
          {
            "NEOVIM",
            icon = "󰣸",
            color = { fg = "#FF00FF", bg = "#1a1a1a", gui = "underline" },
          },
        },
        lualine_x = {
          { function() return string.upper(vim.o.encoding) end, icon = "" },
          { 
            function() 
              return ({ unix = "LF", dos = "CRLF", mac = "CR" })[vim.bo.fileformat]
            end,
            icon = ""
          },
          "filetype",
        },
        lualine_y = {}, -- Убрал progress отсюда, он теперь в lualine_b
        lualine_z = { "location" },
      },
    })
  end,
}

