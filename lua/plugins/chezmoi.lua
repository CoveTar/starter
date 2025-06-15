return {
  "alker0/chezmoi.vim",
  opts = function(_, opts)
    vim.g.chezmoi_auto_apply_enabled = false

    opts.events = opts.events or {}
    opts.events.on_open = {
      override = function(bufnr)
        if vim.g.chezmoi_auto_apply_enabled then
          require("chezmoi.commands.__edit").watch(bufnr)
          vim.notify("Auto apply is ON for chezmoi-managed file", vim.log.levels.INFO)
        else
          vim.notify("Opened chezmoi-managed file (auto apply OFF)", vim.log.levels.WARN)
        end
      end,
    }

    opts.events.on_watch = { notification = { enable = false } }
    opts.events.on_apply = { notification = { enable = false } }

    opts.edit = opts.edit or {}
    opts.edit.watch = false

    return opts
  end,

  config = function(_, opts)
    require("chezmoi").setup(opts)

    -- Define the toggle function
    local function toggle_auto_apply()
      vim.g.chezmoi_auto_apply_enabled = not vim.g.chezmoi_auto_apply_enabled
      local state = vim.g.chezmoi_auto_apply_enabled and "ENABLED" or "DISABLED"
      local level = vim.g.chezmoi_auto_apply_enabled and vim.log.levels.INFO or vim.log.levels.WARN
      vim.notify("Chezmoi auto apply " .. state, level)
    end

    -- Actual keymap + LazyVim which-key registration
    vim.keymap.set("n", "<leader>ct", toggle_auto_apply, { desc = "Toggle chezmoi auto apply" })
  end,
}
