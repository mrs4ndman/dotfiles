return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  enabled = false,
  config = function()
    local LEADER = vim.g.mapleader
    if LEADER == " " then
      LEADER = "SPC"
    end
    require("dashboard").setup({
      theme = "doom",
      shortcut_type = "letter",
      hide = {
        statusline = true,
        winbar = true,
      },
      config = {
        header = {
          "",
          "",
          "███╗   ███╗██████╗ ███████╗ █████╗ ███╗   ██╗██████╗ ███╗   ███╗ █████╗ ███╗   ██╗",
          "████╗ ████║██╔══██╗██╔════╝██╔══██╗████╗  ██║██╔══██╗████╗ ████║██╔══██╗████╗  ██║",
          "██╔████╔██║██████╔╝███████╗███████║██╔██╗ ██║██║  ██║██╔████╔██║███████║██╔██╗ ██║",
          "██║╚██╔╝██║██╔══██╗╚════██║██╔══██║██║╚██╗██║██║  ██║██║╚██╔╝██║██╔══██║██║╚██╗██║",
          "██║ ╚═╝ ██║██║  ██║███████║██║  ██║██║ ╚████║██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║",
          "╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝",
          "",
          "",
        },
        center = {
          {
                { icon = " ", desc = "MrSandman | <github.com/mrs4ndman", action = "" },
                -- { icon = "", desc = "__________", action = "" },
                { icon = " ", desc = " Recent files", shortcut = LEADER .. " tf", action = "Telescope oldfiles" },
                { icon = ",", desc = "Repo search" },
          },
        },
      },
      footer = { "", "The phone is ringing, the world is spinning", "Just let me out" },
    })
  end,
}
