return {
  "scottmckendry/cyberdream.nvim",
  lazy = false, -- загружается сразу, если хочешь — можешь поставить true и добавить events
  priority = 1000, -- важно, чтобы тема загрузилась раньше остальных
  config = function()
    require("cyberdream").setup({
      variant = "default",
      transparent = true,
      saturation = 1,
      italic_comments = true,
      hide_fillchars = false,
      borderless_pickers = true,
      terminal_colors = true,
      cache = false,

      overrides = function(colors)
        return {
          Comment = { fg = "#696969", bg = "NONE", italic = true },
          ["@property"] = { fg = colors.magenta, bold = true },
        }
      end,

      colors = {
        bg = "#000000",
        green = "#00ff00",
        dark = {
          magenta = "#ff00ff",
          fg = "#eeeeee",
        },
        light = {
          red = "#ff5c57",
          cyan = "#5ef1ff",
        },
      },

      extensions = {
        telescope = true,
        notify = true,
        cmp = true,
        noice = true,
        gitsigns = true,
        treesitter = true,
        snacks = true,
      },
    })

    vim.cmd.colorscheme("cyberdream")
    vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight EndOfBuffer guibg=NONE ctermbg=NONE
    ]])
  end,
}
