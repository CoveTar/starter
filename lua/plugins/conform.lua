-- ~/.config/nvim/lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Extend supported filetypes
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      ansible = { "prettier" },
      apache = { "apachefmt" },
      latex = { "tex-fmt" },
    })

    -- Register custom formatters
    opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
      apachefmt = {
        command = "apachefmt", -- must be in $PATH or full path
        args = { "-i", "--indent-width", 4, "--keep-blank-lines" },
        -- cwd = require("conform.util").root_file({ ".apachefmt.conf" }), -- optional
      },
      prettier = {
        prepend_args = {
          "--single-quote",
          "true",
          "--tab-width",
          "2",
          "--trailing-comma",
          "es5",
        },
      },
    })

    -- -- Optional: customize Prettier arguments
    -- opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
    --   prettier = {
    --     prepend_args = { "--tab-width", "2" },
    --   },
    -- })
  end,
}
