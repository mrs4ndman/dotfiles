Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "executor.nvim"

return {
  "google/" .. plugin,
  keys = {
    { "<localleader>xc", "<cmd>ExecutorRun<CR>", desc = "Start Executor" },
    { "<localleader>xs", "<cmd>ExecutorSetCommand<CR>", desc = "Set Executor command" },
    { "<localleader>xd", "<cmd>ExecutorToggleDetail<CR>", desc = "Toggle Executor detail" },
    { "<localleader>xr", "<cmd>ExecutorReset<CR>", desc = "Reset Executor status" },
    { "<localleader>xp", "<cmd>ExecutorShowPresets<CR>", desc = "Show presets for CWD" },
  },
  opts = {
    use_split = true,
    split = {
      position = "right",
      size = math.floor(vim.o.columns * 1/5)
    },
    notifications = {
      task_started = true,
      task_completed = true,
    },
    preset_commands = {
      ["custom-website"] = {
        "npm run dev",
      }
    }
  }
}
