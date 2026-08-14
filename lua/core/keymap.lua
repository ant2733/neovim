vim.keymap.set({"n", "i"}, "<C-z>", "<Cmd>undo<CR>", { silent = true })

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>aa", ":lua print(123)<CR>", {silent = true})

vim.keymap.set("n", "<S-CR>", ":w<CR>:!python %<CR>", {noremap = true})

-- 取消搜索高亮
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")     
