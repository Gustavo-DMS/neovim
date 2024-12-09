-- Basic remaps
vim.keymap.set("n", "<leader>q", "<cmd>wqall!<CR>", { desc = "save and quit" })
vim.keymap.set("n", "<leader>Q", ":q!<cr>", { desc = "quit without saving" })
vim.keymap.set("n", "<leader>w", ":w!<cr>", { desc = "save without quitting" })
vim.keymap.set("n", "<leader>k", "<cmd>bdelete<CR>", { desc = "close buffer" })
vim.keymap.set("n", "<leader>z", "<cmd>Lazy<CR>", { desc = "Open Lazy" })

-- Toggle file explorer
vim.keymap.set("n", "<leader>pv", "<cmd>Neotree toggle<cr>")

-- Toggle wordWrap
vim.keymap.set("n", "<leader>vww", "<cmd>set nowrap!<cr>", { desc = "Toggle word wrap" })

-- Move text on visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- on page scroll center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- colar sem copiar texto e colar direto do clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]], { desc = "paste (behind) from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader><C-p>", [["_dP]], { desc = "Paste without copying" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], { desc = "copy whole line to clipboard" })

-- Delete no save
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete without copying" })

-- format file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "format file" })

-- para trocar de navegar entre buffers e TMUX
vim.keymap.set({ "n", "v" }, "<C-Space>h", "<cmd> TmuxNavigateLeft <CR>")
vim.keymap.set({ "n", "v" }, "<C-Space>j", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set({ "n", "v" }, "<C-Space>k", "<cmd> TmuxNavigateUp<CR>")
vim.keymap.set({ "n", "v" }, "<C-Space>l", "<cmd> TmuxNavigateRight<CR>")

-- navegar Quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>rqf", "<cmd>Cfilter! @%<CR>")

-- Para ver os TODOs dos arquivos pelo telescope
vim.keymap.set("n", "<leader>tt", vim.cmd.TodoTelescope, { desc = "Show TODOs" })

-- Dap keymaps
-- vim.keymap.set('n', '<leader>db', "<cmd> DapToggleBreakpoint <cr>")
-- vim.keymap.set('n', '<leader>dr', "<cmd> DapContinue <cr>")
-- vim.keymap.set('n', '<leader>dur', ":lua require('dapui').open({reset=true}) <cr>")

-- Barbar
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferPick<CR>")

-- Trouble

vim.keymap.set(
	"n",
	"<leader>xx",
	"<cmd>Trouble diagnostics toggle<cr>",
	{ silent = true, noremap = true, desc = "Diagnostics (Trouble)" }
)
vim.keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ silent = true, noremap = true, desc = "Buffer Diagnostics (Trouble)" }
)

vim.keymap.set(
	"n",
	"<leader>cs",
	"<cmd>Trouble symbols toggle focus=false<cr>",
	{ silent = true, noremap = true, desc = "Symbols (Trouble)" }
)

vim.keymap.set(
	"n",
	"<leader>cl",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	{ silent = true, noremap = true, desc = "LSP Definitions / references / ... (Trouble)" }
)

vim.keymap.set(
	"n",
	"<leader>xL",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	{ silent = true, noremap = true, desc = "Location List (Trouble)" }
)

vim.keymap.set(
	"n",
	"<leader>xQ",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	{ silent = true, noremap = true, desc = "Quickfix List (Trouble)" }
)

-- fold toggle
vim.keymap.set("n", "zi", function()
	if vim.o.foldcolumn == "0" then
		vim.o.foldcolumn = "3"
	else
		vim.o.foldcolumn = "0"
	end
end, { desc = "Toggle fold column" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Git files" })
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep	> ") })
end, { desc = "Grep string" })
vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Telescope Buffers" })

-- UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree" })

-- Autosession
-- vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
--     noremap = true,
-- })

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Neogit, { desc = "Open Neogit" })

-- Harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Add to Harpoon" })
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle Harpoon" })

vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(1)
end, { desc = "Select Harpoon 1" })
vim.keymap.set("n", "<C-t>", function()
	harpoon:list():select(2)
end, { desc = "Select Harpoon 2" })
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():select(3)
end, { desc = "Select Harpoon 3" })
vim.keymap.set("n", "<C-s>", function()
	harpoon:list():select(4)
end, { desc = "Select Harpoon 4" })

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)

-- UFOlds
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("userLspConfig", {}),
	callback = function(ev)
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, { buffer = ev.buf, remap = false, desc = "Go to definition" })
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, { buffer = ev.buf, remap = false, desc = "hover" })
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, { buffer = ev.buf, remap = false, desc = "view workspace symbol" })
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, { buffer = ev.buf, remap = false, desc = "view diagnostics" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, { buffer = ev.buf, remap = false, desc = "next diagnostic" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, { buffer = ev.buf, remap = false, desc = "prev diagnostic" })
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, { buffer = ev.buf, remap = false, desc = "view code actions" })
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, { buffer = ev.buf, remap = false, desc = "view references" })
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, { buffer = ev.buf, remap = false, desc = "rename all" })
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, { buffer = ev.buf, remap = false, desc = "view definition" })
	end,
})
