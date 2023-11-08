return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "tpope/vim-dadbod",
    event = "User AstroFile",
    opt = {},
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    event = "User AstroFile",
    opt = {},
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    event = "User AstroFile",
    config = function() require("user.plugins.config.dadbod").setup() end,
  },
}
