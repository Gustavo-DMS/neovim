return {
	"hrsh7th/nvim-cmp",
	-- load cmp on InsertEnter
	event = "InsertEnter",
	-- these dependencies will only be loaded when cmp loads
	-- dependencies are always lazy-loaded unless specified otherwise
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-a>"] = cmp.mapping.complete(),
				["<Tab>"] = nil,
				["<S-Tab>"] = nil,
			}),
			formatting = {
				fields = { "abbr", "menu", "kind" },
				format = function(entry, vim_item)
					-- -- Kind icons
					-- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
					-- Source
					function trim(s)
						local max = 30
						if s and s:len() > max then
							return s:sub(1, max) .. "..."
						end
						return s
					end

					vim_item.menu = trim(vim_item.menu)
					return vim_item
				end,
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
		})

		--     -- Set up lspconfig.
		--     local capabilities = require("cmp_nvim_lsp").default_capabilities()
		--     -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
		--     require("lspconfig")["<YOUR_LSP_SERVER>"].setup({
		--         capabilities = capabilities,
		--     })
	end,
}
