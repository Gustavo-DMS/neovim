local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep	> ") });
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
require("telescope").setup({
    defaults = {
        layout_config = {
            horizontal = {
                preview_cutoff = 0,
            },
        },
        mappings = {
            n = {
                ['<c-d>'] = require('telescope.actions').delete_buffer
            }, -- n
            i = {
                ["<C-h>"] = "which_key",
                ['<c-d>'] = require('telescope.actions').delete_buffer
            } -- i
        }
    },
})
