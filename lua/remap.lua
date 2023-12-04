-- Toggle file explorer
vim.keymap.set("n", "<leader>pv", "<cmd>Neotree toggle<cr>")

-- Toggle wordWrap
vim.keymap.set('n', "<leader>vww", '<cmd>set nowrap!<cr>')

-- Move text on visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- on page scroll center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- colar sem copiar testo e coloar direto do clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])
vim.keymap.set({ "n", "v" }, "<leader><C-p>", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete no save
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- format file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- para trocar de navegar entre buffers e TMUX
vim.keymap.set({ 'n', 'v' }, "<C-h>", "<cmd> TmuxNavigateLeft <CR>")
vim.keymap.set({ 'n', 'v' }, "<C-j>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set({ 'n', 'v' }, "<C-k>", "<cmd> TmuxNavigateUp<CR>")
vim.keymap.set({ 'n', 'v' }, "<C-l>", "<cmd> TmuxNavigateRight<CR>")

-- para trocar de buffers
vim.keymap.set({ 'n', 'v' }, "<C-n>", vim.cmd.bnext)
vim.keymap.set({ 'n', 'v' }, "<C-p>", vim.cmd.bprev)

-- Para ver os TODOs dos arquivos pelo telescope
vim.keymap.set('n', '<leader>tt', vim.cmd.TodoTelescope)

-- Dap keymaps
vim.keymap.set('n', '<leader>db', "<cmd> DapToggleBreakpoint <cr>")
vim.keymap.set('n', '<leader>dr', "<cmd> DapContinue <cr>")
vim.keymap.set('n', '<leader>dur', ":lua require('dapui').open({reset=true}) <cr>")

-- Barbar
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferPick<CR>')

-- Trouble
vim.keymap.set("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
)

vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)

vim.keymap.set("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)

-- fold toggle
vim.keymap.set('n', 'zi', function()
    if vim.o.foldcolumn == "0" then
        vim.o.foldcolumn = "3"
    else
        vim.o.foldcolumn = "0"
    end
end)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep	> ") });
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

-- UndoTree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Autosession
-- vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
--     noremap = true,
-- })

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-m>", ui.toggle_quick_menu)

-- vim.keymap.set("n", "<C-q>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-w>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-e>", function() ui.nav_file(3) end)

-- UFOlds
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
