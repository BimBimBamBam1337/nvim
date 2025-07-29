return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local cyber_colors = {
      purple  = "#c084fc", -- Было #b266ff, теперь насыщенней и ярче
      green   = "#00ff88", -- Было #00ff66, добавила светлее акцент
      magenta = "#ff1aff", -- Чуть глубже
      fg      = "#eeeeee",
      bg      = "#000000",
      cyan    = "#5ef1ff", -- Красивый неоновый голубой
      red     = "#ff5c57",
      yellow  = "#ffd700",
      gray    = "#7f7f7f", -- Чуть светлее серый для контраста
    }


    local custom_theme = {
      normal = { c = { fg = cyber_colors.purple, bg = cyber_colors.bg } },
      insert = { c = { fg = cyber_colors.bg, bg = cyber_colors.green } },
      visual = { c = { fg = cyber_colors.bg, bg = cyber_colors.magenta } },
      replace = { c = { fg = cyber_colors.bg, bg = cyber_colors.red } },
      command = { c = { fg = cyber_colors.bg, bg = cyber_colors.yellow } },
      inactive = { c = { fg = cyber_colors.gray, bg = cyber_colors.bg } },
    }

    vim.cmd(string.format([[
      highlight NormalMode guifg=%s guibg=%s
      highlight InsertMode guifg=%s guibg=%s
      highlight VisualMode guifg=%s guibg=%s
      highlight ReplaceMode guifg=%s guibg=%s
      highlight CommandMode guifg=%s guibg=%s
      highlight InactiveMode guifg=%s guibg=%s
    ]],
      cyber_colors.purple, cyber_colors.bg,
      cyber_colors.bg, cyber_colors.green,
      cyber_colors.bg, cyber_colors.magenta,
      cyber_colors.bg, cyber_colors.red,
      cyber_colors.bg, cyber_colors.yellow,
      cyber_colors.gray, cyber_colors.bg
    ))

    local mode_map = {
      ["NORMAL"] = "%#NormalMode#󰹑 ",
      ["INSERT"] = "%#InsertMode#󰲔 ",
      ["VISUAL"] = "%#VisualMode#󰘖 ",
      ["V-LINE"] = "%#VisualMode#󰘖 ",
      ["V-BLOCK"] = "%#VisualMode#󰘖 ",
      ["REPLACE"] = "%#ReplaceMode#󰲞 ",
      ["COMMAND"] = "%#CommandMode#󰌌 ",
      ["TERMINAL"] = "%#NormalMode# ",
      ["t"] = "%#NormalMode# ",
    }

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
          { "branch", color = { fg = cyber_colors.purple } },
          { "diff", color = { fg = cyber_colors.purple } },
          { "diagnostics", color = { fg = cyber_colors.purple } },
          {
            "progress",
            color = { fg = cyber_colors.purple },
            fmt = function(str) 
              return "%#NormalMode#" .. str
            end
          }
        },
        lualine_c = {
          {
            "filename",
            icon = "",
            color = { fg = cyber_colors.cyan },
          },
          {
            "NEOVIM",
            icon = "󰣸",
            color = { fg = cyber_colors.magenta, bg = cyber_colors.bg, gui = "bold" },
          },
        },
        lualine_x = {
          { function() return string.upper(vim.o.encoding) end, icon = "", color = { fg = cyber_colors.green } },
          { 
            function() 
              return ({ unix = "LF", dos = "CRLF", mac = "CR" })[vim.bo.fileformat]
            end,
            icon = "",
            color = { fg = cyber_colors.yellow }
          },
          "filetype",
        },
        lualine_y = {},
        lualine_z = { "location" },
      },
    })
  end,
}
