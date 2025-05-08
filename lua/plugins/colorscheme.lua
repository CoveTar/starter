return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
  -- Add base16-nvim plugin
  {
    "RRethy/base16-nvim",
    lazy = true, -- Lazy load the plugin
  },
  -- Configure LazyVim to use the equilibrium-dark colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "base16-equilibrium-dark",
    },
  },
}
