return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local text_ascii = {
      [[                                  __]],
      [[     ___     ___    ___   __  __ /\_\    ___ ___]],
      [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
      [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
      [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }

    local header = {}

    for _ = 1, 10 do
      table.insert(header, "")
    end

    for _, value in ipairs(text_ascii) do
      table.insert(header, value)
    end
    for _ = 1, 2 do
      table.insert(header, "")
    end

    dashboard.section.header.val = header

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep<CR>"),
      dashboard.button("c", "  Configure", ":e ~/.config/nvim/lua/plugins/alpha.lua<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    local function footer()
      return "...- ... -.-. --- .--. ."
    end

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true

    alpha.setup(dashboard.opts)
  end,
}

