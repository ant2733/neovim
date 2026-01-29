return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    keys = {
        { "<leader>q", ":bdelete<CR>", silent = true },
        { "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true },
        { "<leader>bp", ":BufferLinePick<CR>", silent = true },
        { "<leader>bc", ":BufferLinePickClose<CR>", silent = true },

        -- 数字键跳转
        { "<leader>1", function() require("bufferline").go_to_buffer(1) end, mode = "n", desc = "Go to buffer 1" },
        { "<leader>2", function() require("bufferline").go_to_buffer(2) end, mode = "n", desc = "Go to buffer 2" },
        { "<leader>3", function() require("bufferline").go_to_buffer(3) end, mode = "n", desc = "Go to buffer 3" },
        { "<leader>4", function() require("bufferline").go_to_buffer(4) end, mode = "n", desc = "Go to buffer 4" },
        { "<leader>5", function() require("bufferline").go_to_buffer(5) end, mode = "n", desc = "Go to buffer 5" },
        { "<leader>6", function() require("bufferline").go_to_buffer(6) end, mode = "n", desc = "Go to buffer 6" },
        { "<leader>7", function() require("bufferline").go_to_buffer(7) end, mode = "n", desc = "Go to buffer 7" },
        { "<leader>8", function() require("bufferline").go_to_buffer(8) end, mode = "n", desc = "Go to buffer 8" },
        { "<leader>9", function() require("bufferline").go_to_buffer(9) end, mode = "n", desc = "Go to buffer 9" },
        -- 缓冲区导航 
        { "<Tab>", "<cmd>BufferLineCycleNext<CR>", mode = "n", desc = "Next buffer" },
        { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", mode = "n", desc = "Previous buffer" },

        -- 水平分屏
        { "<leader>v", "<cmd>vsplit<CR>", mode = "n", desc = "Vertical split" },
        { "<leader>s", "<cmd>split<CR>", mode = "n", desc = "Horizontal split" },

        -- 窗口导航（与 bufferline 导航分开）
        { "<C-h>", "<C-w>h", mode = "n", desc = "Move to left window" },
        { "<C-j>", "<C-w>j", mode = "n", desc = "Move to down window" },
        { "<C-k>", "<C-w>k", mode = "n", desc = "Move to up window" },
        { "<C-l>", "<C-w>l", mode = "n", desc = "Move to right window" },

        -- 调整窗口大小
        { "<C-Up>", "<cmd>resize +2<CR>", mode = "n", desc = "Increase window height" },
        { "<C-Down>", "<cmd>resize -2<CR>", mode = "n", desc = "Decrease window height" },
        { "<C-Left>", "<cmd>vertical resize -2<CR>", mode = "n", desc = "Decrease window width" },
        { "<C-Right>", "<cmd>vertical resize +2<CR>", mode = "n", desc = "Increase window width" },
                        
    },
    lazy = false,
}

