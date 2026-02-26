require("config.lazy")

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.shiftwidth              = 4
vim.opt.tabstop                 = 4
vim.opt.relativenumber          = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.clipboard = "unnamedplus"

-- Auto-reload buffers when the underlying file changes
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    callback = function()
        if vim.fn.mode() ~= "c" then
            vim.cmd("checktime")
        end
    end,
})

vim.g.ctrlp_custom_ignore = '\\v[\\/](\\.git|\\.hg|node_modules|build|tmp|temp)(\\/|$)'

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.api.nvim_create_user_command("NvimTreeSmartToggle", function()
    local api = require("nvim-tree.api")
    if api.tree.is_visible() then
        api.tree.close()
    else
        api.tree.find_file({ open = true, focus = true })
    end
end, {})

vim.keymap.set("n", "<Leader>e", '<cmd>:NvimTreeSmartToggle<cr>')
vim.keymap.set("n", "<Leader>h", '<cmd>:noh<cr>')
vim.keymap.set("n", "<Leader>F", '<cmd>:Format<cr>')

vim.api.nvim_create_user_command("Fmt", function()
    vim.cmd("!pnpm run format")
end, {})

vim.api.nvim_create_user_command("Reload", function()
    for mod in pairs(package.loaded) do
        if mod:match("^config") or mod:match("^plugins") then
            package.loaded[mod] = nil
        end
    end
    vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
    vim.notify("Config reloaded!")
end, {})

vim.api.nvim_create_user_command("Crelpath", function()
    vim.cmd("CopyRelativeFilePath")
end, { desc = "Copy relative file path to clipboard" })

vim.keymap.set("n", "s", '<cmd>:HopChar1<cr>')
vim.keymap.set("n", "<Leader>SS", '<cmd>:GrugFar<cr>')
vim.keymap.set("n", "<Leader>tf", '<cmd>:NvimTreeSmartToggle<cr>')
vim.keymap.set("n", "<C-p>", '<cmd>:FzfLua files<cr>')
vim.keymap.set("n", "<C-A-p>", '<cmd>:FzfLua buffers<cr>')

