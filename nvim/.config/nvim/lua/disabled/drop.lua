return {
  "folke/drop.nvim",
  event = "VeryLazy",
  config = function()
    math.randomseed(os.time())
    require("drop").setup = {
      theme = "stars",
      max = 35,
      interval = 200,
      screensaver = 1000 * 60 * 1,
      filetypes = { "alpha" },
    }
  end,
}
