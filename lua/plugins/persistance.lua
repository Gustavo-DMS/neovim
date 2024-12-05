
    return{
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        },
        init = function()

vim.cmd [[lua require("persistence").load()]]
        end,
    }
