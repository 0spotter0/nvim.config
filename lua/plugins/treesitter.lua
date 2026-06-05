return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").setup()
    require("nvim-treesitter").install({
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
      "markdown_inline",
      "dockerfile",
      "graphql",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
      callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft
        pcall(vim.treesitter.start, buf, lang)
      end,
    })
  end,
}
