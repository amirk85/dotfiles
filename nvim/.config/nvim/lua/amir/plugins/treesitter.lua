return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring", -- Added missing dependency
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = {
					enable = true,                             -- Enable syntax highlighting
					additional_vim_regex_highlighting = false, -- Avoid redundant highlighting
				},
				indent = { enable = true },                  -- Enable indentation
				autotag = { enable = true },                 -- Enable autotagging for HTML/XML-like tags
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"bash",
					"lua",
					"vim",
					"gitignore",
					"query",
					"go",
					"sql",
					"python",
					"c",    -- Added C language support
					"cpp",  -- Added C++ language support
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				sync_install = false, -- Default is false
				auto_install = true,  -- Auto-install missing parsers
				ignore_install = {},  -- No parsers to ignore
				modules = {},         -- Empty modules (default)
			})

			-- Enable ts-context-commentstring plugin for JSX/TSX comments
			require("ts_context_commentstring").setup({
				enable_autocmd = false, -- Disable autocommands
			})
		end,
	},
}
