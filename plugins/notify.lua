return {
  "rcarriga/nvim-notify",
  config = function(_, opts)
    local notify = require "notify"
    opts.background_colour = CustomBackground
    notify.setup(opts)
    vim.notify = notify
  end,
}
