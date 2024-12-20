return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ---- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "lua", "javascript", "typescript", "vimdoc" },

            ---- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            ---- Automatically install missing parsers when entering buffer
            ---- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,
                ---- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                ---- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                ---- Using this option may slow down your editor, and you may see some duplicate highlights.
                ---- Instead of true it can also be a list of languages
                autotag = {
                    enable = true,
                },
                additional_vim_regex_highlighting = false,
            },
            -- context_commentstring = {
            --     enable = true,
            --     enable_autocmd = false,
            -- },
            -- autotag = {
            --     enable = true,
            -- },
        }

        -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        -- parser_config.hypr = {
        --     install_info = {
        --         url = "https://github.com/luckasRanarison/tree-sitter-hypr",
        --         files = { "src/parser.c" },
        --         branch = "master",
        --     },
        --     filetype = "hypr",
        -- }
    end
}
