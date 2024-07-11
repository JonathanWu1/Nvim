local on_attach = function(client, bufnr)
	local map = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	map("<leader>cc", vim.lsp.buf.code_action, "[C]ode [A]ction")

	map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	map("gD", vim.lsp.buf.type_definition, "Type [D]efinition")


	-- See `:help K` for why this keymap
	map("K", vim.lsp.buf.hover, "Hover Documentation")
	-- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
	-- Lesser used LSP functionality
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
end
return {

	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		'stevearc/conform.nvim',
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					-- Use a sub-list to run only the first available formatter
					lua = { "stylua" },
					typescriptreact = { { "prettierd", "prettier" } },
					typescript = { { "prettierd", "prettier" } },
					javascript = { { "prettierd", "prettier" } },
					cs = { { "csharpier" } },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
	{

		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
		dependencies = {
			"neovim/nvim-lspconfig",
			-- plugins to setup lsp servers
			"folke/neodev.nvim",
			"jmederosalvarado/roslyn.nvim",
			{ "j-hui/fidget.nvim", tag = "legacy", config = true },
		},
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			cmp_nvim_lsp.default_capabilities()
			)

			require("mason-lspconfig").setup({
				ensure_installed = { "tailwindcss", "tsserver", "lua_ls", "omnisharp", "rust_analyzer", "html", "graphql" }
			})
			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					require("neodev").setup()
					require("lspconfig").lua_ls.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							Lua = {
								format = { enable = false },
								telemetry = { enable = false },
								workspace = { checkThirdParty = false },
							},
						},
					})
				end,

				["graphql"] = function()
					require("lspconfig").graphql.setup({
						on_attach = on_attach,
						root_dir = lspconfig.util.root_pattern(".graphqlconfig", ".graphqlrc", "package.json"),
						flags = {
							debounce_text_changes = 150,
						},
						capabilities = capabilities,
					})
				end,
			})

		end,
	},
}

