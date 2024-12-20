return {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    init = function()

vim.cmd [[colorscheme onedark_dark]]
    end,
    config = function()
        require("onedarkpro").setup({
            options = {
                cursorline = true,                  -- Use cursorline highlighting?
                transparency = true,                -- Use a transparent background?
                terminal_colors = true,             -- Use the theme's colors for Neovim's :terminal?
                highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
            }
        })
    end
}
