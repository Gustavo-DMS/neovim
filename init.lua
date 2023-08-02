--[[init.lua ]]

--- LEADER
vim.g.mapleader = " "
vim.g.localleader = "\\"

-- IMPORTS
require("set")
require("plugins")
require("remap")
require("netrw")
vim.cmd [[colorscheme moonfly]]
local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

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

autocmd({ "BufWritePre" }, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

vim.keymap.set('n', 'zi', function()
    if vim.o.foldcolumn == "0" then
        vim.o.foldcolumn = "3"
    else
        vim.o.foldcolumn = "0"
    end
end)
