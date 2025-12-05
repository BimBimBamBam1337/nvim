return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "dockerls",
                "jsonls",
                "yamlls",
                "marksman",
            },
            handlers = {
                function(server)
                    require("lspconfig")[server].setup({
                        capabilities = capabilities,
                    })
                end,
            },
        })
    end,
}
