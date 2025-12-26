return {
  "zapling/mason-conform.nvim",
  dependencies = {
    "stevearc/conform.nvim",
    "mason-org/mason.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("mason-conform").setup({
      ensure_installed = true, -- automatically install formatters from conform.config.formatters_by_ft
      -- optional: auto update installed tools
      -- auto_update = true,
    })
  end,
}
