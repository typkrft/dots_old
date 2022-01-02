-- Require our auto commands
require('custom.autochad_cmds')

-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad
local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`
--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

hooks.add("setup_mappings", function(map)
  map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", default_opts)   
-- map("n", "<leader>ff", [[ Telescope find_files hidden=true ]], opt) -- example to delete the buffer
   -- .... many more mappings ....
end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples belowself:

-- TODO: Add Events to plugs to lazy load
hooks.add("install_plugins", function(use)
  use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
            keywords = {
              FIX = {
                icon = " ", -- icon used for the sign, and in search results
                color = "error", -- can be a hex color, or a named color (see below)
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                -- signs = false, -- configure signs for some keywords individually
              },
              TODO = { icon = " ", color = "#bd93f9" },
              HACK = { icon = " ", color = "#ffb86c" },
              WARN = { icon = " ", color = "#ff5555", alt = { "WARNING", "XXX" } },
              PERF = { icon = " ", color = "#8be9fd", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
              NOTE = { icon = " ", color = "#50fa7b", alt = { "INFO" } },
            },
        }
      end
  }

    use {
    'p00f/nvim-ts-rainbow',
    after = "nvim-treesitter",
    }


end)


-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"

vim.g.indentLine_fileTypeExclude = 'dashboard'
vim.g.always_show_bufferline = false


-- fold settings
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldtext = [['>>  '.substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)'.'  ﰂ']]
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1

-- Hide Status
vim.cmd[[
set noshowmode
]]
