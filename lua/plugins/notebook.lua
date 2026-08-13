local is_windows = vim.fn.has("win32") == 1

return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        build = ":UpdateRemotePlugins",
        lazy = false,
        init = function()
            -- Molten is a Python remote plugin. Pin it to the Python that owns
            -- pynvim, jupyter_client, and the installed kernels.
            vim.g.python3_host_prog = vim.fn.exepath("python")

            vim.g.molten_auto_open_output = false
            vim.g.molten_virt_text_output = true
            vim.g.molten_virt_text_max_lines = 20
            vim.g.molten_virt_lines_off_by_1 = true
            vim.g.molten_output_virt_lines = true
            vim.g.molten_wrap_output = true
            vim.g.molten_output_win_max_height = 20
            vim.g.molten_output_win_max_width = 100
            vim.g.molten_output_show_more = true
            vim.g.molten_tick_rate = 200
            vim.g.molten_limit_output_chars = 50000
            vim.g.molten_use_border_highlights = true

            -- image.nvim/Molten inline images are unsupported on Windows.
            -- Keep notebook text inline and open plots through the OS viewer.
            vim.g.molten_image_provider = is_windows and "none" or "image.nvim"
            vim.g.molten_auto_image_popup = is_windows
        end,
        keys = {
            { "<localleader>mi", "<cmd>MoltenInit<cr>", desc = "Notebook: initialize kernel" },
            { "<localleader>ml", "<cmd>MoltenEvaluateLine<cr>", desc = "Notebook: run line" },
            { "<localleader>mr", "<cmd>MoltenReevaluateCell<cr>", desc = "Notebook: rerun cell" },
            { "<localleader>mo", "<cmd>noautocmd MoltenEnterOutput<cr>", desc = "Notebook: enter output" },
            { "<localleader>mh", "<cmd>MoltenHideOutput<cr>", desc = "Notebook: hide output" },
            { "<localleader>md", "<cmd>MoltenDelete<cr>", desc = "Notebook: delete cell" },
            { "<localleader>mx", "<cmd>MoltenInterrupt<cr>", desc = "Notebook: interrupt kernel" },
            { "<localleader>mp", "<cmd>MoltenImagePopup<cr>", desc = "Notebook: open image" },
            {
                "<localleader>m",
                ":<C-u>MoltenEvaluateVisual<cr>gv",
                mode = "v",
                desc = "Notebook: run selection",
            },
        },
    },

    {
        "3rd/image.nvim",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            -- Neovide on Windows does not implement a supported image.nvim
            -- graphics backend. Keep the plugin installed for compatible
            -- terminal sessions without emitting broken escape sequences here.
            if is_windows or vim.g.neovide then
                return
            end

            require("image").setup({
                backend = "kitty",
                processor = "magick_cli",
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = false,
                        floating_windows = false,
                        filetypes = { "markdown", "quarto" },
                    },
                },
                max_height_window_percentage = 50,
                window_overlap_clear_enabled = true,
                editor_only_render_when_focused = true,
            })
        end,
    },

    {
        "quarto-dev/quarto-nvim",
        ft = { "quarto", "markdown" },
        dependencies = {
            "jmbuhr/otter.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            lspFeatures = {
                enabled = true,
                chunks = "curly",
                languages = { "python", "bash", "html", "lua" },
                diagnostics = { enabled = false },
                completion = { enabled = true },
            },
            codeRunner = {
                enabled = true,
                default_method = "molten",
                never_run = { "yaml" },
            },
        },
        config = function(_, opts)
            require("quarto").setup(opts)

            local group = vim.api.nvim_create_augroup("quarto_notebook_keys", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                pattern = { "quarto", "markdown" },
                callback = function(event)
                    local runner = require("quarto.runner")
                    local map_opts = { buffer = event.buf, silent = true }
                    vim.keymap.set("n", "<localleader>rc", runner.run_cell,
                        vim.tbl_extend("force", map_opts, { desc = "Notebook: run cell" }))
                    vim.keymap.set("n", "<localleader>ra", runner.run_above,
                        vim.tbl_extend("force", map_opts, { desc = "Notebook: run cell and above" }))
                    vim.keymap.set("n", "<localleader>rA", runner.run_all,
                        vim.tbl_extend("force", map_opts, { desc = "Notebook: run all cells" }))
                    vim.keymap.set("n", "<localleader>rl", runner.run_line,
                        vim.tbl_extend("force", map_opts, { desc = "Notebook: run line" }))
                    vim.keymap.set("v", "<localleader>r", runner.run_range,
                        vim.tbl_extend("force", map_opts, { desc = "Notebook: run selection" }))
                    if vim.fn.executable("quarto") == 1 then
                        vim.keymap.set("n", "<localleader>qp", "<cmd>QuartoPreview<cr>",
                            vim.tbl_extend("force", map_opts, { desc = "Quarto: preview" }))
                    end
                end,
            })
        end,
    },

    {
        "GCBallesteros/jupytext.nvim",
        lazy = false,
        opts = {
            style = "hydrogen",
            output_extension = "auto",
            custom_language_formatting = {
                python = {
                    extension = "qmd",
                    style = "quarto",
                    force_ft = "quarto",
                },
            },
        },
    },
}
