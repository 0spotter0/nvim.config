return {
  "prettier/vim-prettier",
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json" },
  config = function()
    -- Disable the default prettier shortcut, as it will
    -- be enabled per-filetype in ftplugin
    vim.keymap.set('n', '<leader>p', '<Nop>')
  end
}
