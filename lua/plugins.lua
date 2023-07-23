local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "folke/which-key.nvim",
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    "mbbill/undotree",
    "tpope/vim-surround",
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    "tpope/vim-fugitive",
})

