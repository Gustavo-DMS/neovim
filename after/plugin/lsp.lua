local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'eslint',
    'jsonls',
    'quick_lint_js',
    'lua_ls',
    'marksman',
    'pyright',
    'sqlls',
    'tailwindcss',
    'tsserver',
    'clangd',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-a>"] = cmp.mapping.complete(),
})
cmp.config.formatting = {
    format = require("tailwindcss-colorizer-cmp").formatter
}
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "Go to definition" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc = "hover" })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        { buffer = bufnr, remap = false, desc = "view workspace symbol" })
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false, desc = "view diagnostics" })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false, desc = "next diagnostic" })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false, desc = "prev diagnostic" })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc = "view code actions" })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = bufnr, remap = false, desc = "view references" })
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false, desc = "rename all" })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = bufnr, remap = false, desc = "view definition" })
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
end)

lsp.setup()
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
})
vim.diagnostic.config({
    virtual_text = true
})
local function organize_imports()
    local params = { command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0) }, title = "" }
    vim.lsp.buf.execute_command(params)
end

require('lspconfig').tsserver.setup { commands = {
    OrganizeImports = { organize_imports, description = "Organize Imports" } } }


local fqbn = "arduino:avr:mega"
require('lspconfig').arduino_language_server.setup {
    cmd = {
        "arduino-language-server",
        "-cli-config", "/home/gustavo/.arduino15/arduino-cli.yaml",
        "-fqbn",
        fqbn
    },
}
