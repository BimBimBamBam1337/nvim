
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",
    "p00f/nvim-ts-rainbow",  -- Подсветка для скобок
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- Отключаем встроенный модуль context_commentstring в Treesitter
    vim.g.skip_ts_context_commentstring_module = true

    require("nvim-treesitter.configs").setup {
      ensure_installed = { "lua", "python", "bash", "json", "html", "css" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
          "#FF6030", "#FFD54F", "#D4FF75", "#5ECFFF", "#569BFF", "#DB80FF", "#C0FF3E"
        }
      }
    }

    require("ts_context_commentstring").setup {
      enable_autocmd = false,
    }
  end
}

