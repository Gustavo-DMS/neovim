-- Toggle file explorer
vim.keymap.set("n", "<leader>pv", "<cmd>Neotree toggle<cr>")
-- Toggle wordWrap
vim.keymap.set('n', "<M-z>", '<cmd>set nowrap!<cr>')
-- Move text on visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- on page scroll center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- colar sem copiar testo
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- para trocar de navegar entre buffers
vim.keymap.set({ 'n', 'v' }, "<C-h>", "<C-w>h")
vim.keymap.set({ 'n', 'v' }, "<C-j>", "<C-w>j")
vim.keymap.set({ 'n', 'v' }, "<C-k>", "<C-w>k")
vim.keymap.set({ 'n', 'v' }, "<C-l>", "<C-w>l")

-- para trocar de buffers
vim.keymap.set({ 'n', 'v' }, "<C-n>", vim.cmd.bnext)
vim.keymap.set({ 'n', 'v' }, "<C-p>", vim.cmd.bprev)
-- Para ver os todos dos arquivos pelo telescope
vim.keymap.set('n', '<leader>tt', vim.cmd.TodoTelescope)
