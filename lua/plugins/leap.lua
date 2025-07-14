return {
    "ggandor/leap.nvim",
    config = function()
        -- require('leap').create_default_mappings()
        vim.keymap.set({ "n" }, "s", "<Plug>(leap-forward)")
        vim.keymap.set({ "n" }, "S", "<Plug>(leap-backward)")
        vim.keymap.set({ "n" }, "gs", "<Plug>(leap-from-window)")
    end,
}
