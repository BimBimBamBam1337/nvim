return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "navarasu/onedark.nvim" },
  config = function()
    -- Палитра onedark deep
    local palette = require("onedark.palette").deep

    local colors = {
      bg      = palette.bg0,     -- фон панели
      fg      = palette.fg,      -- основной текст
      purple  = palette.purple,  -- режим NORMAL
      green   = palette.green,   -- режим INSERT
      magenta = palette.magenta, -- режим VISUAL
      red     = palette.red,     -- режим REPLACE / ошибки
      yellow  = palette.yellow,  -- предупреждения
      cyan    = palette.cyan,    -- нейтральные иконки / тип файла
      gray    = palette.grey,    -- неактивное состояние
    }

    -- Тема для lualine
    local custom_theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      insert = { c = { fg = colors.bg, bg = colors.green } },
      visual = { c = { fg = colors.bg, bg = colors.magenta } },
      replace = { c = { fg = colors.bg, bg = colors.red } },
      command = { c = { fg = colors.bg, bg = colors.yellow } },
      inactive = { c = { fg = colors.gray, bg = colors.bg } },
    }

    -- Хайлайты для режима
    vim.cmd(string.format([[
      highlight NormalMode guifg=%s guibg=%s
      highlight InsertMode guifg=%s guibg=%s
      highlight VisualMode guifg=%s guibg=%s
      highlight ReplaceMode guifg=%s guibg=%s
      highlight CommandMode guifg=%s guibg=%s
      highlight InactiveMode guifg=%s guibg=%s
    ]],
      colors.purple, colors.bg,
      colors.bg, colors.green,
      colors.bg, colors.magenta,
      colors.bg, colors.red,
      colors.bg, colors.yellow,
      colors.gray, colors.bg
    ))

    -- Иконки режимов (с твоим шрифтом всё отображается идеально)
    local mode_map = {
      ["NORMAL"]  = "%#NormalMode#󰹑 NORMAL",
      ["INSERT"]  = "%#InsertMode#󰲔 INSERT",
      ["VISUAL"]  = "%#VisualMode#󰘖 VISUAL",
      ["V-LINE"]  = "%#VisualMode#󰘖 V-LINE",
      ["V-BLOCK"] = "%#VisualMode#󰘖 V-BLOCK",
      ["REPLACE"] = "%#ReplaceMode#󰲞 REPLACE",
      ["COMMAND"] = "%#CommandMode#󰌌 CMD",
      ["TERMINAL"] = "%#NormalMode# TERM",
      ["t"] = "%#NormalMode# TERM",
    }

    require("lualine").setup({
      options = {
        theme = custom_theme,
        icons_enabled = true,
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        always_divide_middle = true,
      },
      sections = {
        -- Левая часть
        lualine_a = {
          {
            "mode",
            fmt = function(str) return mode_map[str] or str end,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {
          { "branch", icon = "", color = { fg = colors.purple } },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.yellow },
              removed = { fg = colors.red },
            },
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            diagnostics_color = {
              error = { fg = colors.red },
              warn = { fg = colors.yellow },
              info = { fg = colors.cyan },
            },
          },
        },

        -- Центр
        lualine_c = {
          {
            "filename",
            path = 1,
            color = { fg = colors.fg },
          },
          {
            function()
              local clients = vim.lsp.get_active_clients({ bufnr = 0 })
              if #clients == 0 then return "" end
              local names = {}
              for _, c in ipairs(clients) do
                table.insert(names, c.name)
              end
              return " " .. table.concat(names, ", ")
            end,
            color = { fg = colors.magenta },
          },
        },

        -- Правая часть
        lualine_x = {
          { function() return " " .. vim.bo.filetype end, color = { fg = colors.cyan } },
          { function() return " " .. string.upper(vim.o.encoding) end, color = { fg = colors.green } },
          {
            function()
              return ({ unix = "LF", dos = "CRLF", mac = "CR" })[vim.bo.fileformat]
            end,
            icon = "",
            color = { fg = colors.yellow },
          },
        },
        lualine_y = {
          { "progress", icon = "", color = { fg = colors.purple } },
        },
        lualine_z = {
          { "location", icon = "", color = { fg = colors.green } },
          {
            function()
              return os.date(" %H:%M")
            end,
            color = { fg = colors.gray },
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}

