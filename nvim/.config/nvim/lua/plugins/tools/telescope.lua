Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "telescope.nvim"
return {
  "nvim-telescope/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = { "Telescope", "Themer" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "barrett-ruth/telescope-http.nvim",
  },
  keys = {
    -- TELESCOPE
    { "<leader>tf",  "<cmd>Telescope find_files<CR>",     desc = "Find files" },
    { "<leader>tg",  "<cmd>Telescope grep_string<CR>",    desc = "Grep through files" },
    { "<leader>tb",  "<cmd>Telescope buffers<CR>",        desc = "List buffers" },
    { "<leader>vh",  "<cmd>Telescope help_tags<CR>",      desc = "Help tags" },
    { "<leader>sg",  "<cmd>Telescope grep_string<CR>",    desc = "Fast string grep" },
    { "<leader>tr",  "<cmd>Telescope oldfiles<CR>",       desc = "Recent files" },
    { "<leader>tli", "<cmd>Telescope lsp_incoming_calls", desc = "LSP incoming calls" },
    { "<leader>tlo", "<cmd>Telescope lsp_outgoing_calls", desc = "LSP outgoing calls" },
  },
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.pickers = {
        colorscheme = { enable_preview = true },
        find_files = {
          find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--strip-cwd-prefix" },
          theme = "ivy",
        },
        oldfiles = {
          theme = "ivy",
        },
        live_grep = {
          layout_strategy = "vertical",
          -- theme = "dropdown"
        },
        buffers = { ignore_current_buffer = true },
      }
      opts.defaults = {
        theme = "dropdown",
        vimgrep_arguments = {
          "rg",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!{.git,.svn,.hg,.DS_Store,thumbs.db,node_modules,bower_components}",
        },
        sort_mru = true,
        sorting_strategy = "ascending",
        color_devicons = true,
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
          horizontal = { width_padding = 0.04, height_padding = 0.1 },
          vertical = { width_padding = 0.05, height_padding = 1 },
        },
        border = true,
        prompt_prefix = "   ",
        hl_result_eol = false,
        -- results_title = "",
        wrap_results = true,
        hidden = true,
        mappings = {
          i = {
            ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
            ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
            ["<C-n>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-p>"] = require("telescope.actions").preview_scrolling_up,
            ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
            ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
            -- ["<M-p>"] = action_layout.toggle_preview,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<Esc>"] = require("telescope.actions").close,
          },
          n = {
            -- ["<M-p>"] = action_layout.toggle_preview,
            ["<C-n>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-p>"] = require("telescope.actions").preview_scrolling_up,
            ["<M-s>"] = require("telescope.actions").file_split,
            ["<M-v>"] = require("telescope.actions").file_vsplit,
          },
        },
      }
    end
  end,
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("http")
    vim.keymap.set("n", "<leader>tH", "<cmd>Telescope http list<CR>", { desc = "HTTP Status codes" })
    -- colorizer
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local sorters = require("telescope.sorters")

    local function on_escape(prompt_bufnr)
      local selected = action_state.get_selected_entry()
      local currentColorscheme = vim.cmd("colorscheme")

      if selected[1] ~= currentColorscheme then
        vim.cmd("colorscheme " .. currentColorscheme)
      end
      vim.print(currentColorscheme)
      actions.close(prompt_bufnr)
    end

    local function enter(prompt_bufnr)
      local selected = action_state.get_selected_entry()
      -- print(vim.inspect(selected))
      local cmd = "colorscheme " .. selected[1]
      vim.cmd(cmd)
      actions.close(prompt_bufnr)
    end

    local function next_color(prompt_bufnr)
      actions.move_selection_next(prompt_bufnr)
      local selected = action_state.get_selected_entry()
      local cmd = "colorscheme " .. selected[1]
      vim.cmd(cmd)
    end

    local function prev_color(prompt_bufnr)
      actions.move_selection_previous(prompt_bufnr)
      local selected = action_state.get_selected_entry()
      local cmd = "colorscheme " .. selected[1]
      vim.cmd(cmd)
    end

    local opts = {
      prompt_title = "Which color?",
      layout_strategy = "vertical",
      layout_config = {
        height = 0.45,
        width = 0.25,
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      finder = finders.new_table({
        "tokyodark",
        "tokyonight",
        "oxocarbon",
        "catppuccin",
        "rose-pine",
        "enfocado",
        "material-deep-ocean",
        "fluoromachine",
        -- "github_dark_high_contrast",
        -- "carbonfox",
        -- "doom-one",
        -- "onedark_dark",
        -- "vscode",
        -- "midnight",
        -- "gruber-darker",
        -- "nord",
        -- "nordic",
        -- "dracula",
        -- "onenord",
        -- "nightfox",
        -- "nordfox",
        -- "tol",
        -- "noctishc",
        -- "citruszest",
        -- "nvimgelion",
        -- "space-nvim",
        -- "oh-lucy",
        -- "palenightfall",
        -- "rasmus",
        -- "tokyonight-moon",
      }),
      sorter = sorters.get_generic_fuzzy_sorter({}),
      ---@diagnostic disable-next-line: unused-local
      attach_mappings = function(prompt_bufnr, map)
        local escape = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
        map("i", escape, on_escape)
        map("i", "<C-c>", on_escape)
        map("i", "<CR>", enter)
        map("i", "<C-k>", prev_color)
        map("i", "<C-j>", next_color)
        return true
      end,
    }

    local colors = pickers.new(opts)

    vim.api.nvim_create_user_command("Themer", function() colors:find() end, {})

    -- last-color plugin
    -- local theme = require("last-color").recall() or "tokyonight"
    -- vim.cmd(("colorscheme %s"):format(theme))
  end,
}
