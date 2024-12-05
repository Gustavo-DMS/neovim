return {
    'nvim-telescope/telescope.nvim',
    -- or                              , branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
        }
    },
    config = function()
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

        require('telescope').load_extension('fzf')
    end
}
