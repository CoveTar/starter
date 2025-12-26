-- Also recognize templated extensions regardless of path
vim.filetype.add({
  -- extension = {
  --   ["toml.tmpl"] = "toml",
  --   ["yaml.tmpl"] = "yaml",
  --   ["sh.tmpl"] = "sh",
  --   ["zsh.tmpl"] = "zsh",
  --   ["json.tmpl"] = "json",
  -- },
  pattern = {
    [".*/.local/share/chezmoi/.*/.chezmoiexternals/.*"] = "toml",
    [".*/.local/share/chezmoi/.*/.chezmoiignore"] = "chezmoitmpl",
    [".*/.config/environment.*"] = "systemd",
    [".*/roles/.*/meta/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/vars/.*%.ya?ml"] = "yaml.ansible",
  },
})
