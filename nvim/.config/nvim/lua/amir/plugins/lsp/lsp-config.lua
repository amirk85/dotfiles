return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Define diagnostic signs
    local signs = {
      { name = "DiagnosticSignError", text = " " },
      { name = "DiagnosticSignWarn", text = " " },
      { name = "DiagnosticSignInfo", text = "󰠠 " },
      { name = "DiagnosticSignHint", text = " " },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name })
    end

    -- Configure diagnostics (enable inline messages)
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●", -- Customize the prefix (e.g., "■", "▶", "◆")
        spacing = 2,
      },
      signs = true, -- Enable gutter signs
      underline = true, -- Underline diagnostic lines
      update_in_insert = false, -- Prevent updates while typing
      severity_sort = true, -- Sort by severity
    })

    local servers = { "html", "tsserver", "cssls", "tailwindcss", "gopls", "pyright", "templ", "lua_ls" }

    -- LSP key mappings
    local on_attach = function(_, bufnr)
      local opts = function(desc)
        return { noremap = true, silent = true, buffer = bufnr, desc = desc }
      end
      local keymap = vim.keymap.set

      keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts("Show references"))
      keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts("Go to definition"))
      keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
      keymap("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
      keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts("Show buffer diagnostics"))
      keymap("n", "[d", vim.diagnostic.goto_prev, opts("Go to previous diagnostic"))
      keymap("n", "]d", vim.diagnostic.goto_next, opts("Go to next diagnostic"))
      keymap("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))
    end

    -- Set up LSP servers
    for _, server in ipairs(servers) do
      local lsp_server = server
      if lsp_server == "tsserver" then
        lsp_server = "ts_ls"
      end
      lspconfig[lsp_server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = lsp_server == "lua_ls" and {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          },
        } or nil,
      })
    end

    -- Handlers for hover and signature
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  end,
}
