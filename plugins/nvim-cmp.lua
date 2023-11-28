return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "kristijanhusak/vim-dadbod-completion", -- Completion for Databases
  },
  opts = function(_, opts)
    opts.sources = require("astronvim.utils").list_insert_unique(opts.sources, {
      { name = "vim-dadbod-completion", priority = 1000 }, -- Source for Database Completion
    })

    return opts
  end,
}
