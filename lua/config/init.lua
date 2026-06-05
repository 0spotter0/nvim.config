local augroup = vim.api.nvim_create_augroup
local custom_augroup = augroup('custom_augroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = custom_augroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Map j/k to gj/gk in any buffer where 'wrap' is enabled
local function sync_wrap_motions()
    if vim.wo.wrap then
        vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { buffer = true, expr = true })
        vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { buffer = true, expr = true })
    else
        pcall(vim.keymap.del, 'n', 'j', { buffer = true })
        pcall(vim.keymap.del, 'n', 'k', { buffer = true })
    end
end

autocmd('OptionSet', {
    group = custom_augroup,
    pattern = "wrap",
    callback = sync_wrap_motions,
})

autocmd({"BufWinEnter"}, {
    group = custom_augroup,
    pattern = "*",
    callback = sync_wrap_motions,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
