--[[init.lua ]]

--- LEAD-R
vim.g.mapleader = " "
vim.g.localleader = "\\"

-- IMPORTS
require("set")      
require("plugins")      
require("remap")
require("whichkey")
vim.cmd [[colorscheme moonfly]]