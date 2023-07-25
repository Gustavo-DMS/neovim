vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- -- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
