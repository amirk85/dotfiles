return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Diagnostics config
    vim.diagnostic.config({
      virtual_text = { prefix = "●", spacing = 2 },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = "󰠠 ",
          [vim.diagnostic.severity.HINT] = " ",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- Keymaps
    local on_attach = function(_, bufnr)
      local opts = function(desc) return { noremap = true, silent = true, buffer = bufnr, desc = desc } end
      local keymap = vim.keymap.set
      keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
      keymap("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
      keymap("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts("Prev diagnostic"))
      keymap("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts("Next diagnostic"))
      keymap("n", "K", vim.lsp.buf.hover, opts("Hover docs"))
    end

    local servers = { "html", "ts_ls", "cssls", "tailwindcss", "gopls", "pyright", "templ", "lua_ls", "clangd" }

    for _, server in ipairs(servers) do
      -- Define/override config
      vim.lsp.config(server, {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = server == "lua_ls" and {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          },
        } or nil,
      })

      -- Enable it
      vim.lsp.enable(server)
    end

    vim.o.winborder = "rounded"
  end,
}
