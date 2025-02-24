return {
  "ggandor/leap.nvim",
  dependencies = { "tpope/vim-repeat" },
  config = function()
    require("leap").add_default_mappings()
    require("leap.user").set_repeat_keys("<CR>", "<BS>")
  end
}

