local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").elixirls.setup({
  cmd = {"/Users/robmerrell/.elixir-ls/release/language_server.sh"},
  capabilities = capabilities,
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false
    }
  }
})

vim.api.nvim_exec([[
  autocmd BufWritePre *.ex,*.exs lua vim.lsp.buf.formatting_sync(nil, 1000)
]], true)
