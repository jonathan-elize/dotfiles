local null_ls_status_ok, null_ls = pcall(require, "null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		formatting.stylua,
		diagnostics.yamllint,
		diagnostics.eslint,
		-- code_actions.eslint,
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		print(client.supports_method("textDocument/formatting"))
			if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
									print(client.name)
									-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
									vim.lsp.buf.format({ bufnr = bufnr })
							end,
					})
			end
	end,
})
vim.lsp.buf.format({ timeout_ms = 5000 })
