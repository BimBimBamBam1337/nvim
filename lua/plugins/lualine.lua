
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local custom_theme = {
      normal = { c = { fg = "#a8a8a8", bg = "#1a1a1a" } },
      insert = { c = { fg = "#a8a8a8", bg = "#3d8b37" } },
      visual = { c = { fg = "#a8a8a8", bg = "#684ca4" } },
      replace = { c = { fg = "#a8a8a8", bg = "#d75f5f" } },
      command = { c = { fg = "#a8a8a8", bg = "#ffd700" } },
      inactive = { c = { fg = "#5f5f5f", bg = "#1a1a1a" } },
    }

    local mode_map = {
      ["NORMAL"] = "󰹑 ",
      ["INSERT"] = "󰲔 ",
      ["VISUAL"] = "󰘖 ",
      ["V-LINE"] = "󰘖 ",
      ["V-BLOCK"] = "󰘖 ",
      ["REPLACE"] = "󰲞 ",
      ["COMMAND"] = "󰌌 ",
      ["TERMINAL"] = " ",
      ["t"] = " ", -- альтернатива для терминала
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
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
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
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })

    -- Цветовые схемы для разных режимов
    vim.cmd [[
      highlight NormalMode guifg=#A8A8A8 guibg=#1A1A1A
      highlight InsertMode guifg=#A8A8A8 guibg=#3D8B37
      highlight VisualMode guifg=#A8A8A8 guibg=#684CA4
      highlight ReplaceMode guifg=#A8A8A8 guibg=#D75F5F
      highlight CommandMode guifg=#A8A8A8 guibg=#FFD700
      highlight InactiveMode guifg=#5F5F5F guibg=#1A1A1A
    ]]
  end,
}

