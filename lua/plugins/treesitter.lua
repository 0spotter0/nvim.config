return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "c",
        "cpp",
        "rust",
        "python",
        "html",
        "css",
        "java",
        "javascript",
        "typescript",
        "tsx",
        "elixir",
        "heex",
        "json",
        "yaml",
        "bash",
        "markdown",
        "dockerfile",
        "graphql",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
