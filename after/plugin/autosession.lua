local function close_neo_tree()
    require 'neo-tree.sources.manager'.close_all()
    vim.notify('closed all')
end

require("auto-session").setup {
    log_level = vim.log.levels.ERROR,
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    auto_session_use_git_branch = false,
    auto_session_enable_last_session = false,
    auto_session_create_enabled = false,
    auto_save_enabled = true,
    auto_restore_enabled = true,

    bypass_session_save_file_types = { "neo-tree" },
    pre_save_cmds = {
        close_neo_tree,
    },

    -- ⚠️ This will only work if Telescope.nvim is installed
    -- The following are already the default values, no need to provide them if these are already the settings you want.
    session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
    },
}

-- Set mapping for searching a session.
-- ⚠️ This will only work if Telescope.nvim is installed
vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
    noremap = true,
})








require 'auto-session'.setup {
}
