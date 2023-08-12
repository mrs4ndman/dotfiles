local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "cellular-automaton.nvim"
-- Goofy stuff:
return {
  "eandrju/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = "CellularAutomaton",
  keys = {
    { "<leader>cat", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "cool stuff" },
  },
  config = function()
    require("cellular-automaton").register_animation({
      fps = 50,
      name = "slide",
      update = function(grid)
        for i = 1, #grid do
          local prev = grid[i][#grid[i]]
          for j = 1, #grid[i] do
            grid[i][j], prev = prev, grid[i][j]
          end
        end
        return true
      end,
    })
    local screensaver = function(grid, swapper)
      local get_character_cols = function(row)
        local cols = {}
        for i = 1, #row do
          if row[i].char ~= " " then
            table.insert(cols, i)
          end
        end
        return cols
      end
      for i = 1, #grid do
        local cols = get_character_cols(grid[i])
        if #cols > 0 then
          local last_col = cols[#cols]
          local prev = grid[i][last_col]
          for _, j in ipairs(cols) do
            prev = swapper(prev, i, j)
          end
        end
      end
    end
    require("cellular-automaton").register_animation({
      fps = 50,
      name = "screensaver",
      update = function(grid)
        screensaver(grid, function(prev, i, j)
        grid[i][j], prev = prev, grid[i][j]
        return prev
        end)
        return true
      end
    })
    require("cellular-automaton").register_animation({
      fps = 50,
      name = "screensaver-inplace",
      update = function(grid)
        screensaver(grid, function(prev, i, j)
          grid[i][j].hl_group, prev.hl_group = prev.hl_group, grid[i][j].hl_group
          return prev
        end)
        return true
      end,
    })
  end,
}
