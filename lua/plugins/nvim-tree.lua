return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {
        -- 自动更新配置
        sync_root_with_cwd = true,  -- 工作目录变化时同步根目录
        respect_buf_cwd = true,     -- 尊重缓冲区的目录
        
        update_focused_file = {
          enable = true,           -- 自动聚焦当前文件
          update_cwd = true,       -- 自动更新工作目录
          update_root = true,      -- 自动更新根目录
        },

        actions = {
            open_file = {
                quit_on_open = true
            }
        }
    },
    keys = {
        {"<leader>th", ":NvimTreeToggle<CR>"}
    }
}
