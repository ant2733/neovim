return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "bash",
            "html",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "toml",
            "yaml",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
