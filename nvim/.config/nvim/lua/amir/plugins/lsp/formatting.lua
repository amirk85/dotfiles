return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- Load only when opening or creating a file
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "dprint", "prettierd", "prettier" },
				typescript = { "dprint", "prettierd", "prettier" },
				javascriptreact = { "dprint", "prettierd", "prettier" },
				typescriptreact = { "dprint", "prettierd", "prettier" },
				css = { "dprint", "prettierd", "prettier" },
				html = { "dprint", "prettierd", "prettier" },
				json = { "dprint", "prettierd", "prettier" },
				yaml = { "dprint", "prettierd", "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "goimports", "gofumpt" },
				gotmpl = { "gofmt", "gofumpt" },      -- Add Go template support
				sql = { "sql-formatter", "sqlfmt" },
				sh = { "shfmt" },                     -- Added Shell Script formatter
				toml = { "prettier" },                -- Added TOML support
				c = { "clang-format" },               -- Added C formatter
				cpp = { "clang-format" },             -- Added C++ formatter
				ruby = { "rufo", "rubocop", "prettier" }, -- Added Ruby formatter
			},
			-- format_on_save = { -- Optional: Enable auto-format on save
			--   timeout_ms = 1500,
			--   lsp_fallback = true,
			-- },
			notify_on_error = false, -- Prevent spammy error notifications
			stop_after_first = true, -- Stop after first successful formatter
		})

		-- Keymap for manual formatting
		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or selection", silent = true })
	end,
}
