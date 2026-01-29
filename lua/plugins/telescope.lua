return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 &&"
                .. "cmake --build build --config Release && "
                .. "cmake --install build --prefix build",
        },
    },
    cmd = "Telescope",
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", mode = "n", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", mode = "n", desc = "Live grep" },
    },
    config = function(_, opts)
        local telescope = require "telescope"
        telescope.setup(opts)
        telescope.load_extension("fzf")
    end,
}

