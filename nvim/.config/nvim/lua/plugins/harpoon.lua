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
        "<leader>1",
        "<leader>2",
        "<leader>3",
        "<leader>4",
        "<leader>5",
        "<leader>6",
        "<leader>7",
        "<leader>8",
        "<leader>9",
        "<leader>0",
        "<leader>a",
        "<leader>h",
        "<leader>kn",
        "<leader>kp",
        "<leader>t1",
        "<leader>t2",
        "<leader>t3",
        "<leader>t4",
    },
    opts = function(_, opts)
        if Use_Defaults(plugin) then
            opts = opts
        else
            opts.global_settings = {
                save_on_toggle = true,
                save_on_change = true,
                mark_branch = false,
            }
        end
    end,
    config = function(_, opts)
        require(plugin).setup(opts)
        local mark = require(plugin .. ".mark")
        local ui = require(plugin .. ".ui")
        local term = require( plugin .. ".term")

        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon a file" })
        vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu,  {desc = "Harpoon menu" })

        vim.keymap.set("n", "<leader>kn", ui.nav_next, { desc = "Harpoon switch next" })
        vim.keymap.set("n", "<leader>kp", ui.nav_prev, { desc = "Harpoon switch previous" })

        vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon file", silent = true } )
        vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon file", silent = true } )
        vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon file", silent = true } )
        vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon file", silent = true } )
        vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = "Harpoon file", silent = true } )
        vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end, { desc = "Harpoon file", silent = true } )
        vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end, { desc = "Harpoon file", silent = true } )
        vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end, { desc = "Harpoon file", silent = true } )
        vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end, { desc = "Harpoon file", silent = true } )
        vim.keymap.set("n", "<leader>0", function() ui.nav_file(0) end, { desc = "Harpoon file", silent = true } )

        vim.keymap.set("n", "<leader>t1", function() term.gotoTerminal(1) end, { desc = "Harpoon terminal 1", silent = true })
        vim.keymap.set("n", "<leader>t2", function() term.gotoTerminal(2) end, { desc = "Harpoon terminal 2", silent = true })
        vim.keymap.set("n", "<leader>t3", function() term.gotoTerminal(3) end, { desc = "Harpoon terminal 3", silent = true })
        vim.keymap.set("n", "<leader>t4", function() term.gotoTerminal(4) end, { desc = "Harpoon terminal 4", silent = true })
    end
}
