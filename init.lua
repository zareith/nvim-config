require("config.lazy")

vim.o.number = true
vim.opt.shiftwidth              = 4
vim.opt.tabstop                 = 4
vim.opt.relativenumber          = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.ctrlp_custom_ignore = '\\v[\\/](\\.git|\\.hg|node_modules)$'

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>e", '<cmd>:NvimTreeToggle<cr>')
vim.keymap.set("n", "<Leader>h", '<cmd>:noh<cr>')
vim.keymap.set("n", "<Leader>F", '<cmd>:Format<cr>')
vim.keymap.set("n", "<Leader>D", '<cmd>:CocDiagnostics<cr>')


