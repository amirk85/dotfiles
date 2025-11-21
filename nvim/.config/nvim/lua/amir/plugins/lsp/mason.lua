return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "single",
			},
			ensure_installed = {
				-- Language Servers
				"pyright",                -- Python
				"tsserver",               -- TypeScript/JavaScript
				"gopls",                  -- Go
				"sumneko_lua",            -- Lua
				"clangd",                 -- C/C++ LSP
				-- Linters
				"flake8",                 -- Python Linter
				"eslint_d",               -- JavaScript/TypeScript Linter
				"golangci_lint",          -- Go Linter
				"clang-format",           -- C/C++ Formatter
				-- Formatters
				"black",                  -- Python Formatter
				"prettier",               -- Code Formatter
				"stylua",                 -- Lua Formatter
				"shfmt",                  -- Shell Script Formatter
				-- Additional Tools
				"dockerfile_language_server", -- Dockerfile support
				"yaml-language-server",   -- YAML support
			},
		})
	end,
}
