return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  -- "christoomey/vim-tmux-navigator", -- tmux & split window navigation

  -- around/inside
  {
    "echasnovski/mini.ai",
    version = false,
    config = function()
      require("mini.ai").setup()
    end,
  },

  -- bracket pairs
  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
      require("mini.pairs").setup()
    end,
  },
}
