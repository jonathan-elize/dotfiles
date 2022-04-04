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
		code_actions.eslint,
	},
	--null-ls is not setup by nvim-lsp, so has to be done here
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
					augroup LspFormatting
							autocmd! * <buffer>
							autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
					augroup END
					]])
		end
	end,
})
