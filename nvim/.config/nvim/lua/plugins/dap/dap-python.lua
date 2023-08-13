return {
  "mfussenegger/nvim-dap-python",
  dependencies = { "mfussenegger/nvim-dap" },
  ft = "python",
  keys = {
    {
      "<localleader>DPt",
      function()
        require("dap-python").test_method()
      end,
      desc = "Debug test method",
    },
    {
      "<localleader>DPc",
      function()
        require("dap-python").test_class()
      end,
      desc = "Debug test class",
    },
  },
  config = function()
    local path = require("mason-registry").get_package("debugpy"):get_install_path()
    require("dap-python").setup(path .. "/venv/bin/python")
  end,
}
