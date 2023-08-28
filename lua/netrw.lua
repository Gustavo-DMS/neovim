vim.g.netrw_banner = 0

vim.g.netrw_liststyle = 3

vim.g.netrw_browse_split = 0

vim.g.netrw_altv = 1

vim.g.netrw_winsize = 26
--augroup ProjectDrawer
--autocmd!
--autocmd VimEnter * :Vexplore
--augroup END
-- Moder Lua auto-command for launching netrwPlugin which shipped with the nvim
-- local mygroup = vim.api.nvim_create_augroup("loading_netrwPlugin", { clear = true })
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--     pattern = { "*" },
--     command = ":Vexplore",
--     group   = mygroup
-- })
