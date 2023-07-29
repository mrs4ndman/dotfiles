local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
  -- 3.- Theme plugins config
  -- Remember previous colorscheme
  {
    "raddari/last-color.nvim",
    enabled = Is_Enabled("last-color.nvim"),
  },
  {
    "rose-pine/neovim", -- the coolest color scheme B)
    lazy = true,
    name = "rose-pine",
    opts = {
      variant = "main",
      dark_variant = "main",
      bold_vert_split = true,
      disable_background = true,
      disable_float_background = false,
      disable_italics = true,
      highlight_groups = { NotifyBackground = { bg = 'base' } }
    },
  },

  {
    "folke/tokyonight.nvim",
    enabled = Is_Enabled("tokyonight.nvim"),
    lazy = true,
    opts = function(_, opts)
      if Use_Defaults("tokyonight.nvim") then
        opts = opts
      else
        opts = {
          style = "night",
          light_style = "day",
          transparent = false,
          styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            sidebars = "dark",
            floats = "dark",
          },
          hide_inactive_statusline = false,
          dim_inactive = true,
          lualine_bold = true,
        }
      end
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      background = { light = "latte", dark = "mocha" },
      transparent_background = false,
      show_end_of_buffer = false,
      dim_inactive = { enabled = false, shade = "dark", percentage = 0.2 },
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        harpoon = true,
        illuminate = true,
        lsp_trouble = true,
        leap = true,
        mason = true,
        mini = true,
        navic = { enabled = true },
        noice = true,
        notify = true,
        nvimtree = true,
        rainbow_delimiters = true,
        telescope = true,
        treesitter_context = true,
        treesitter = true,
        which_key = true,
      },
    },
    config = function()
      vim.opt.guicursor = ""
    end
  },
  {
    "EdenEast/nightfox.nvim",
    enabled = Is_Enabled("nightfox.nvim"),
    lazy = true,
    opts = function(_, opts)
      if Use_Defaults("nightfox.nvim") then
        opts = opts
      else
        opts = {
          options = {
            transparent = false,
            dim_inactive = true,
            module_default = true,
          },
        }
      end
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    enabled = Is_Enabled("onedarkpro.nvim"),
    config = function()
      require("onedarkpro").setup({
        plugins = { all = true },
        highlights = {
          Comment = { italic = true },
          Directory = { bold = true },
          ErrorMsg = { italic = true, bold = true },
        }
      })
    end
  },
  {
    "Mofiqul/dracula.nvim",
    enabled = Is_Enabled("dracula.nvim"),
    lazy = true,
    config = function()
      require("dracula").setup({
        show_end_of_buffer = false,
        transparent_bg = false,
        italic_comment = true,
      })
    end
  },
  {
    "rmehri01/onenord.nvim",
    enabled = Is_Enabled("onenord.nvim"),
    lazy = true,
    opts = function(_, opts)
      if Use_Defaults("onenord.nvim") then
        opts = opts
      else
        opts = {
          theme = "dark",
          borders = true,
          fade_nc = false,
          disable = { cursorline = true, eob_lines = true },
        }
      end
    end,
  },
  {
    "maxmx03/fluoromachine.nvim",
    enabled = Is_Enabled("fluoromachine.nvim"),
    config = function()
      require("fluoromachine").setup({
        glow = false,
        theme = "fluoromachine",
      })
    end
  },
  {
    "marko-cerovac/material.nvim",
    enabled = Is_Enabled("material.nvim"),
    config = function()
      require("material").setup({
        contrast = {
          terminal = true,
          sidebars = false,
          floating_windows = true,
          cursor_line = true,
          non_current_windows = true,
        },
        plugins = {
          "nvim-cmp",
          "nvim-navic",
          "telescope",
          "trouble",
          "which-key",
        },
        disable = {
          colored_cursor = true,
          borders = false,
          background = false,
          eob_lines = true,
        },
      })
    end
  },
  {
    "Mofiqul/vscode.nvim",
    enabled = Is_Enabled("vscode.nvim"),
    opts = { italic_comments = true },
  },
  {
    "tiagovla/tokyodark.nvim",
    enabled = Is_Enabled("tokyodark.nvim"),
    config = function()
      vim.g.tokyodark_enable_italic = false
      vim.g.tokyodark_enable_italic_comment = true
    end
  },
  {
    "blazkowolf/gruber-darker.nvim",
    enabled = Is_Enabled("gruber-darker.nvim"),
    opts = {
      bold = true,
      italic = {
        comments = true,
      },
      undercurl = false,
      underline = true,
    }
  },
  {
    "projekt0n/github-nvim-theme",
    enabled = Is_Enabled("github-nvim-theme"),
    config = function()
      require("github-theme").setup({
        options = {
          hide_end_of_buffer = true,
          dim_inactive = true,
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          }
        }
      })
    end
  },
  {
    "NTBBloodbath/doom-one.nvim",
    enabled = Is_Enabled("doom-one.nvim"),
    config = function()
      vim.g.doom_one_terminal_colors = true
      vim.g.doom_one_italic_comments = true
      vim.g.doom_one_enable_treesitter = true
      vim.g.doom_one_diagnostics_text_color = true
      -- Integrations
      vim.g.doom_one_plugin_telescope = true

      vim.g.doom_one_plugin_whichkey = true
      vim.g.doom_one_plugin_vim_illuminate = true
    end,
  },
  {
    "lunarvim/horizon.nvim",
    enabled = Is_Enabled("horizon.nvim"),
    lazy = true,
  },
  {
    "shaunsingh/nord.nvim",
    enabled = Is_Enabled("nord.nvim"),
    lazy = true,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = true
    end,
  },
  {
    "rafamadriz/neon",
    enabled = Is_Enabled("neon"),
    lazy = true,
    config = function()
      vim.g.neon_style = "doom"
      vim.g.neon_italic_comment = true
      vim.g.neon_bold = true
      vim.g.neon_transparent = false
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    enabled = Is_Enabled("oxocarbon.nvim"),
    config = function()
      vim.opt.guicursor = ""
    end
  },
  {
    "AlexvZyl/nordic.nvim",
    enabled = Is_Enabled("nordic.nvim"),
    config = function()
      require("nordic").setup({
        bold_keywords = true,
        italic_comments = true,
        bright_border = true,
        noice = {
          style = "classic",
        },
        telescope = {
          style = "classic"
        },
        leap = {
          dim_backdrop = true,
        },
        ts_context = {
          dark_background = true,
        }
      })
    end
  },
  {
    "zootedb0t/citruszest.nvim",
    enabled = Is_Enabled("citruszest.nvim"),
  },
  {
    "nyngwang/nvimgelion",
    enabled = Is_Enabled("nvimgelion")
  },
  {
    "JoosepAlviste/palenightfall.nvim",
    enabled = Is_Enabled("palenightfall.nvim"),
  },

  {
    "kvrohit/rasmus.nvim",
    enabled = Is_Enabled("rasmus.nvim"),
    config = function()
      vim.g.rasmus_italic_comments = true
      vim.g.rasmus_bold_keywords = true
      vim.g.rasmus_bold_functions = true
      vim.g.rasmus_variant = "dark"
    end
  }
}
