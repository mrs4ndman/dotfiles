return {
  -- Language / debugging plugins
  "mfussenegger/nvim-dap",
  dependencies = {
    { "folke/which-key.nvim" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },
    -- DAP adapters
    { "jbyuki/one-small-step-for-vimkind", module = "osv", ft = "lua" },
  },
  config = function(_, opts)
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    local dap, dapui = require("dap"), require("dapui")
    dap.configurations.lua = {
      {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
        host = function()
          local value = vim.fn.input("Host [127.0.0.1]: ")
          if value ~= "" then
            return value
          end
          return "127.0.0.1"
        end,
        port = function()
          local val = tonumber(vim.fn.input("Port: ", "8086"))
          assert(val, "Please provide a port number")
          return val
        end,
      },
    }
    dap.adapters.nlua = function(callback, config)
      callback({ type = "server", host = config.host, port = config.port })
    end

    require("mason").setup()
    require("mason-nvim-dap").setup({
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        -- DAP
        "bash-debug-adapter",
        -- 'codelldb',
        "debugpy",
        "delve",
        "go-debug-adapter",
        "java-debug-adapter",
        "js-debug-adapter",
        "php-debug-adapter",
      },
    })

    require("nvim-dap-virtual-text").setup({
      commented = true,
    })

    dapui.setup(opts)

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end
  end,

  keys = {
    {
      "<localleader>Du",
      function()
        require("dapui").toggle()
      end,
      desc = "DAP Toggle",
    },
    {
      "<localleader>Db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "DAP Toggle Breakpoint",
      { silent = true },
    },
    {
      "<localleader>Dc",
      function()
        require("dap").continue()
      end,
      desc = "DAP Continue",
    },
    {
      "<localleader>DC",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "DAP Run To Cursor",
    },
    {
      "<localleader>Dg",
      function()
        require("dap").goto_()
      end,
      desc = "DAP Go to line (no execute)",
    },
    {
      "<localleader>Di",
      function()
        require("dap").step_into()
      end,
      desc = "DAP Step Into",
    },
    {
      "<localleader>Dj",
      function()
        require("dap").down()
      end,
      desc = "DAP Down",
    },
    {
      "<localleader>Dk",
      function()
        require("dap").up()
      end,
      desc = "DAP Up",
    },
    {
      "<localleader>Dl",
      function()
        require("dap").run_last()
      end,
      desc = "DAP Run Last",
    },
    {
      "<localleader>Do",
      function()
        require("dap").step_out()
      end,
      desc = "DAP Step-Out",
    },
    {
      "<localleader>DO",
      function()
        require("dap").step_over()
      end,
      desc = "DAP Step-Over",
    },
    {
      "<localleader>Dp",
      function()
        require("dap").pause()
      end,
      desc = "DAP Pause",
    },
    {
      "<localleader>Dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "DAP Toggle REPL",
    },
    {
      "<localleader>Ds",
      function()
        require("dap").session()
      end,
      desc = "DAP Session",
    },
    {
      "<localleader>Dt",
      function()
        require("dap").terminate()
      end,
      desc = "DAP Terminate",
    },
    {
      "<localleader>Dw",
      function()
        require("dap.ui.widgets").hover()
      end,
      desc = "DAP Widgets",
    },
  },
}
