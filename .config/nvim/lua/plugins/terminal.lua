return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>tp",
      function()
        Snacks.terminal(nil, {
          win = {
            position = "float",
            border = "rounded",
            width = 0.8,
            height = 0.8,
          },
        })
      end,
      desc = "Popup terminal",
    },
    {
      "<leader>tr",
      function()
        Snacks.terminal(nil, { win = { position = "right", width = 0.4 } })
      end,
      desc = "Right-side terminal",
    },
    {
      "<leader>tl",
      function()
        Snacks.terminal(nil, { win = { position = "left", width = 0.3 } })
      end,
      desc = "Left-side terminal",
    },
  },
}
