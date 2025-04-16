
return {
  "mhinz/vim-startify",
  event = "VimEnter",
  config = function()
    vim.g.startify_lists = {
      { type = "sessions",  header = { "   📌 Sessions" } },
      { type = "dir",       header = { "   📂 Recent files in " .. vim.fn.getcwd() } },
      { type = "files",     header = { "   📄 Recent files" } },
      { type = "bookmarks", header = { "   ⭐ Bookmarks" } },
    }

    -- Закладки для быстрого доступа
    vim.g.startify_bookmarks = {
      { c = "~/.config/nvim" },
      { d = "~/dev" },
    }

    -- Красивый ASCII-баннер
    vim.g.startify_custom_header = {
      " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
      " ████╗  ██║██║   ██║██║████╗ ████║",
      " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
      " ██║╚██╗██║██║   ██║██║██║╚██╔╝██║",
      " ██║ ╚████║╚██████╔╝██║██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝     ╚═╝",
      "       🚀 Welcome to Neovim!      ",
    }

    -- Автоматически загружать последнюю сессию
    vim.g.startify_session_persistence = 1

    -- Настраиваем ключевые сочетания для быстрого открытия
    vim.api.nvim_set_keymap("n", "<leader>ss", ":SSave ", { noremap = true, silent = false })
    vim.api.nvim_set_keymap("n", "<leader>sl", ":SLoad ", { noremap = true, silent = false })
    vim.api.nvim_set_keymap("n", "<leader>sd", ":SDelete ", { noremap = true, silent = false })
    vim.api.nvim_set_keymap("n", "<leader>st", ":Startify<CR>", { noremap = true, silent = true })

    -- Открывать `Startify`, если в `nvim` запущен без аргументов
    vim.cmd([[
      autocmd VimEnter * if !argc() | Startify | endif
    ]])
  end
}

