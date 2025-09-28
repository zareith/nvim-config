require("config.lazy")

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.shiftwidth              = 4
vim.opt.tabstop                 = 4
vim.opt.relativenumber          = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.clipboard = "unnamedplus"

vim.g.ctrlp_custom_ignore = '\\v[\\/](\\.git|\\.hg|node_modules|build|tmp|temp)(\\/|$)'

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>e", '<cmd>:NvimTreeToggle<cr>')
vim.keymap.set("n", "<Leader>h", '<cmd>:noh<cr>')
vim.keymap.set("n", "<Leader>F", '<cmd>:Format<cr>')

vim.keymap.set("n", "s", '<cmd>:HopChar1<cr>')
vim.keymap.set("n", "<Leader>SS", '<cmd>:GrugFar<cr>')
vim.keymap.set("n", "<Leader>tf", '<cmd>:NvimTreeFindFile<cr>')

vim.keymap.set("n", "<Leader>tf", '<cmd>:NvimTreeFindFile<cr>')
vim.keymap.set("n", "<C-p>", '<cmd>:FzfLua files<cr>')
vim.keymap.set("n", "<C-A-p>", '<cmd>:FzfLua buffers<cr>')

