Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "harpoon"

return {
  -- 6.- ThePrimeagen plugins (Blazingly Fast)
  "ThePrimeagen/" .. plugin, -- Reeling those files in
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>1", desc = "Harpoon file 1" },
    { "<leader>2", desc = "Harpoon file 2" },
    { "<leader>3", desc = "Harpoon file 3" },
    { "<leader>4", desc = "Harpoon file 4" },
    { "<leader>5", desc = "Harpoon file 5" },
    { "<leader>6", desc = "Harpoon file 6" },
    { "<leader>7", desc = "Harpoon file 7" },
    { "<leader>8", desc = "Harpoon file 8" },
    { "<leader>9", desc = "Harpoon file 9" },
    { "<leader>0", desc = "Harpoon file 10" },
    { "<localleader><localleader>", desc = "Harpoon menu" },
    { "<localleader>a", desc = "Harpoon file 1" },
    { "<localleader>s", desc = "Harpoon file 2" },
    { "<localleader>d", desc = "Harpoon file 3" },
    { "<localleader>f", desc = "Harpoon file 4" },
    { "<leader>a", desc = "Harpoon add" },
    { "<leader>h", desc = "Harpoon menu" },
    { "<leader>kn", desc = "Harpoon next" },
    { "<leader>kp", desc = "Harpoon prev" },
    { "<leader>t1", desc = "Harpoon terminal 1" },
    { "<leader>t2", desc = "Harpoon terminal 2" },
    { "<leader>t3", desc = "Harpoon terminal 3" },
    { "<leader>t4", desc = "Harpoon terminal 4" },
  },
  config = function()
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = true,
        save_on_change = true,
        mark_branch = false,
      },
    })
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    local term = require("harpoon.term")

    vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon a file" })
    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Harpoon menu" })
    vim.keymap.set("n", "<localleader><localleader>", ui.toggle_quick_menu, { desc = "Harpoon menu" })

    vim.keymap.set("n", "<leader>kn", ui.nav_next, { desc = "Harpoon switch next" })
    vim.keymap.set("n", "<leader>kp", ui.nav_prev, { desc = "Harpoon switch previous" })

    local localleaderKeys = { a = 1, s = 2, d = 3, f = 4 }

    for k, v in pairs(localleaderKeys) do
      vim.keymap.set("n", "<localleader>" .. k, function()
        ui.nav_file(v)
      end)
    end

    for i = 1, 9 do
      vim.keymap.set("n", string.format("<leader>%s", i), function()
        ui.nav_file(i)
      end)
    end
    for i = 1, 4 do
      vim.keymap.set("n", string.format("<leader>T%s", i), function()
        term.gotoTerminal(i)
      end)
    end
  end,
}
