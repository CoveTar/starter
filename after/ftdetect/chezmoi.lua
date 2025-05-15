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
  },
})
