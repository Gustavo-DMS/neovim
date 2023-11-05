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
