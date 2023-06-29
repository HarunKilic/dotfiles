return {
  "levouh/tint.nvim", -- unfocused windows are darker
  event = "BufReadPost",
  config = function()
    require("tint").setup {
      tint = -65,
      highlight_ignore_patterns = { "WinSeparator", "Status.*" },
    }
    -- fix neotree/tint issue not giving colors back to the text buffer
    vim.keymap.set("n", "<leader>e", function()
      vim.cmd [[Neotree toggle]]
      local t = require "tint"
      t.toggle()
      t.toggle()
    end, { desc = "Toggle Explorer" })
  end,
}
