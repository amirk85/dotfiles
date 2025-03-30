return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        -- transparent_background = true,
        transparent_background = false,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     vim.cmd("colorscheme rose-pine")
  --   end,
  -- },

  -- {
  --   "sainnhe/everforest",
  --   priority = 1000, -- Ensures it loads first
  --   config = function()
  --     vim.o.background = "dark" -- or "light" if you prefer
  --     vim.g.everforest_background = "hard" -- Options: soft, medium, hard
  --     vim.cmd([[colorscheme everforest]])
  --   end,
  -- },
}
