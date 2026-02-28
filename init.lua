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

vim.api.nvim_create_user_command("WinSave", function(opts)
    local reg = opts.args ~= "" and opts.args or "w"

    local function serialize(node)
        if node[1] == "leaf" then
            local winid = node[2]
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(winid))
            return {
                kind = "leaf",
                buf = bufname ~= "" and bufname or nil,
                width = vim.api.nvim_win_get_width(winid),
                height = vim.api.nvim_win_get_height(winid),
            }
        else
            local children = {}
            for _, child in ipairs(node[2]) do
                table.insert(children, serialize(child))
            end
            return { kind = node[1], children = children }
        end
    end

    vim.fn.setreg(reg, vim.json.encode(serialize(vim.fn.winlayout())))
    vim.notify("Window layout saved to register " .. reg)
end, { nargs = "?", desc = "Save window layout to a register" })

vim.api.nvim_create_user_command("WinRestore", function(opts)
    local reg = opts.args ~= "" and opts.args or "w"
    local content = vim.fn.getreg(reg)
    if content == "" then
        vim.notify("Register " .. reg .. " is empty", vim.log.levels.WARN)
        return
    end

    local ok, saved = pcall(vim.json.decode, content)
    if not ok then
        vim.notify("Invalid layout data in register " .. reg, vim.log.levels.ERROR)
        return
    end

    local saved_splitright = vim.opt.splitright:get()
    local saved_splitbelow = vim.opt.splitbelow:get()
    vim.opt.splitright = false
    vim.opt.splitbelow = false

    local size_targets = {}

    -- Rebuild splits in reverse child order: the last child occupies the
    -- current window; vsplit/split opens a new window to the left/above and
    -- moves focus there, so the next (earlier) child lands in the right place.
    local function restore(node)
        if node.kind == "leaf" then
            if node.buf then pcall(vim.cmd, "edit " .. vim.fn.fnameescape(node.buf)) end
            table.insert(size_targets, {
                winid = vim.api.nvim_get_current_win(),
                width = node.width,
                height = node.height,
            })
        else
            local children = node.children
            local split_cmd = node.kind == "row" and "vsplit" or "split"
            restore(children[#children])
            for i = #children - 1, 1, -1 do
                vim.cmd(split_cmd)
                restore(children[i])
            end
        end
    end

    vim.cmd("only")
    restore(saved)

    for _, t in ipairs(size_targets) do
        pcall(vim.api.nvim_win_set_width, t.winid, t.width)
        pcall(vim.api.nvim_win_set_height, t.winid, t.height)
    end

    vim.opt.splitright = saved_splitright
    vim.opt.splitbelow = saved_splitbelow
end, { nargs = "?", desc = "Restore window layout from a register" })

vim.api.nvim_create_user_command("WinMax", function()
    if vim.fn.winnr('$') == 1 then
        vim.notify("Already at single window", vim.log.levels.INFO)
        return
    end
    vim.cmd("WinSave W")
    vim.cmd("only")
end, { desc = "Maximize current window, hiding others" })

vim.api.nvim_create_user_command("WinUnmax", function()
    vim.cmd("WinRestore W")
end, { desc = "Restore window layout after WinMax" })

vim.keymap.set("n", "s", '<cmd>:HopChar1<cr>')
vim.keymap.set("n", "<Leader>SS", '<cmd>:GrugFar<cr>')
vim.keymap.set("n", "<Leader>tf", '<cmd>:NvimTreeSmartToggle<cr>')
vim.keymap.set("n", "<C-p>", '<cmd>:FzfLua files<cr>')
vim.keymap.set("n", "<C-A-p>", '<cmd>:FzfLua buffers<cr>')

