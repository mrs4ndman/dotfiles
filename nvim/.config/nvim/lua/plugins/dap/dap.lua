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
      "<leader>Du",
      function()
        require("dapui").toggle()
      end,
      "DAP Toggle",
    },
    {
      "<leader>Db",
      function()
        require("dap").toggle_breakpoint()
      end,
      "DAP Toggle Breakpoint",
      { silent = true },
    },
    {
      "<leader>Dc",
      function()
        require("dap").continue()
      end,
      "DAP Continue",
    },
    {
      "<leader>DC",
      function()
        require("dap").run_to_cursor()
      end,
      "DAP Run To Cursor",
    },
    {
      "<leader>Dg",
      function()
        require("dap").goto_()
      end,
      "DAP Go to line (no execute)",
    },
    {
      "<leader>Di",
      function()
        require("dap").step_into()
      end,
      "Step Into",
    },
    {
      "<leader>Dj",
      function()
        require("dap").down()
      end,
      "DAP Down",
    },
    {
      "<leader>Dk",
      function()
        require("dap").up()
      end,
      "DAP Up",
    },
    {
      "<leader>Dl",
      function()
        require("dap").run_last()
      end,
      "DAP Run Last",
    },
    {
      "<leader>Do",
      function()
        require("dap").step_out()
      end,
      "DAP Step-Out",
    },
    {
      "<leader>DO",
      function()
        require("dap").step_over()
      end,
      "DAP Step-Over",
    },
    {
      "<leader>Dp",
      function()
        require("dap").pause()
      end,
      "DAP Pause",
    },
    {
      "<leader>Dr",
      function()
        require("dap").repl.toggle()
      end,
      "DAP Toggle REPL",
    },
    {
      "<leader>Ds",
      function()
        require("dap").session()
      end,
      "DAP Session",
    },
    {
      "<leader>Dt",
      function()
        require("dap").terminate()
      end,
      "DAP Terminate",
    },
    {
      "<leader>Dw",
      function()
        require("dap.ui.widgets").hover()
      end,
      "DAP Widgets",
    },
  },
}
