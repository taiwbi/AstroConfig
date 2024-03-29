-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<Tab>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-Tab>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<leader>bn"] = {
      function() vim.cmd "Telescope buffers" end,
      desc = "Show Buffers list",
    },
    ["<leader>Db"] = {
      function() vim.cmd "DBUIToggle" end,
      desc = "Show the Database UI tooltip",
    },
    ["<leader>gg"] = {
      function() vim.cmd "Flog" end,
      desc = "Shows the Git commits graph",
    },
    ["<leader>T"] = {
      desc = " Todos list",
    },
    ["<leader>Tt"] = {
      function() vim.cmd "TodoTelescope" end,
      desc = "Todos list in Telescope",
    },
    ["<leader>Tl"] = {
      function() vim.cmd "TodoLocList" end,
      desc = "Todos list in Location list",
    },
    -- Open Alpha when the last buffesr closes
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },
    -- ChatGPT
    ["<leader>a"] = {
      desc = "AI Assistant",
    },
    ["<leader>ac"] = {
      function() vim.cmd "ChatGPTCompleteCode" end,
      desc = "Get code suggestion from GPT",
    },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
