return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "rust_analyzer",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local opts = { buffer = event.buf, remap = false }
          vim.keymap.set("n", "gd",          vim.lsp.buf.definition,       opts)
          vim.keymap.set("n", "K",           vim.lsp.buf.hover,            opts)
          vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
          vim.keymap.set("n", "<leader>vd",  vim.diagnostic.open_float,    opts)
          vim.keymap.set("n", "[d",          vim.diagnostic.goto_next,     opts)
          vim.keymap.set("n", "]d",          vim.diagnostic.goto_prev,     opts)
          vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action,      opts)
          vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references,       opts)
          vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename,           opts)
          vim.keymap.set("i", "<C-h>",       vim.lsp.buf.signature_help,   opts)
        end,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
    end,
  },
}
