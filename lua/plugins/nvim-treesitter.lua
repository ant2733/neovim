return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup()

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "lua", "toml", "markdown", "python", "cpp" },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
