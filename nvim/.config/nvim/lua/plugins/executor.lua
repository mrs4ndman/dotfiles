Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "executor.nvim"

return {
  "google/" .. plugin,
  event = "VeryLazy",
  keys = {
    { "<leader>Xc", "<cmd>ExecutorRun<CR>", desc = "Start Executor" },
    { "<leader>Xs", "<cmd>ExecutorSetCommand<CR>", desc = "Set Executor command" },
    { "<leader>Xd", "<cmd>ExecutorToggleDetail<CR>", desc = "Toggle Executor detail" },
    { "<leader>Xr", "<cmd>ExecutorReset<CR>", desc = "Reset Executor status" },
    { "<leader>Xp", "<cmd>ExecutorShowPresets<CR>", desc = "Show presets for CWD" },
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
