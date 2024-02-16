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
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opt = {},
    event = "VeryLazy"
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedarkpro").setup {
        options = {
          transparency = true,
        },
      }
    end,
  },
  {
    "adalessa/laravel.nvim",
    name = "laravel",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    event = { "VeryLazy" },
    config = function()
      require("laravel").setup()
      require("telescope").load_extension "laravel"
    end,
  },
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local rt = require "rust-tools"
      rt.setup {
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      }
    end,
    event = { "BufRead *.rs" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "User AstroFile",
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    config = function()
      require("tabnine").setup {
        disable_auto_comment = true,
        accept_keymap = "<C-]>",
        dismiss_keymap = "<C-[>",
        debounce_ms = 400,
        suggestion_color = { gui = "#2b2b2b", cterm = 150 },
        exclude_filetypes = { "TelescopePrompt", "neo-tree" },
        log_file_path = nil, -- absolute path to Tabnine log file
      }
    end,
    event = "User AstroFile",
  },
  {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.typescript" },
    { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  },
}
