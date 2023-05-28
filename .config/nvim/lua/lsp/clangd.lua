local lspconfig =  require('lspconfig')


local on_attach = function(_, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      -- 绑定快捷键
      require('keybindings').maplsp(buf_set_keymap)
    end
      
lspconfig.clangd.setup({
  --capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	settings = {
		clangd = {
			semanticHighlighting = true,
			serverCompletionRanking = true,
			fallbackFlags = { "-std=c++11" },
			detectExtensionConflicts = true,
			checkUpdates = false,
			arguments = { "--all-scopes-completion", "--cross-file-rename" },
			restartAfterCrash = true,
			onConfigChanged = "prompt",
			header_search = { "/opt/homebrew/include", "/opt/homebrew/lib" },
			header_insertion = "never",
			header_insertion_decorators = "with-includepath",
			completion_style = "detailed",
			suggest_missing_includes = true,
		},
	},
})


