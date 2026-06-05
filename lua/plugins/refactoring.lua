return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "lewis6991/async.nvim",
  },
  keys = {
    { "<leader>rs", function() require("refactoring").select_refactor() end, mode = { "n", "x" }, desc = "Select refactor" },
  },
}
