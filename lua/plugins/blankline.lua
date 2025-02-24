
return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            indent = { char = "▏" },  -- Символ для отображения отступов
            scope = { enabled = true },  -- Включение выделения области контекста
        })
    end,
}

