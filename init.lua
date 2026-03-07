require("core.basic")
require("core.keymap")
require("core.lazy")
dofile(vim.fn.stdpath("config") .. "/custom/lsp.lua")

if vim.g.neovide then
    -- 修改顶部栏的颜色
    vim.g.neovide_title_background_color = string.format(
    "%x",
    vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
    )

    vim.g.neovide_title_text_color = "pink"

    -- 设置字号大小
    vim.g.neovide_scale_factor = 1.1
     -- 动态调整字号（快捷键）
    vim.keymap.set("n", "<C-=>", function()
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1
    end, { desc = "Increase font size" })
    
    vim.keymap.set("n", "<C-->", function()
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.1
    end, { desc = "Decrease font size" }) 
end

