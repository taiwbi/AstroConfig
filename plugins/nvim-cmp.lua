return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "kristijanhusak/vim-dadbod-completion", -- Completion for Databases
  },
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    opts.sources = cmp.config.sources {
      { name = "vim-dadbod-completion", priority = 1000 }, -- Source for Database Completion
    }

    -- return the new table to be used
    return opts
  end,
}
