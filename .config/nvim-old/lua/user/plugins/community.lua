return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.pack.lua",               enabled = true },
  { import = "astrocommunity.pack.json",              enabled = true },
  { import = "astrocommunity.pack.bash",              enabled = true },
  { import = "astrocommunity.pack.markdown",          enabled = true },
  { import = "astrocommunity.pack.yaml",              enabled = true },
  { import = "astrocommunity.completion.copilot-lua", enabled = true },
  { import = "astrocommunity.pack.typescript",        enabled = true },
  {
    "copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
          --dismiss = false,
        },
      },
    },
  },
  { import = "astrocommunity.colorscheme.github-nvim-theme", enabled = true },
  {
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
  },
  {
    "gitsigns.nvim",
    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame = true,
      current_line_blame_opts = { ignore_whitespace = true },
    },
  },

  { import = "astrocommunity.utility.noice-nvim" },
  {
    "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      }
    end,
  },
  { "lvimuser/lsp-inlayhints.nvim",                               config = true },
  {
    "noice.nvim",
    opts = {
      messages = { enabled = true },
      cmdline = {
        format = {
          filter = { pattern = "^:%s*!", icon = "$ ", ft = "sh" },
          IncRename = {
            pattern = "^:%s*IncRename%s+",
            icon = " ",
            conceal = true,
          },
        },
      },
      views = {
        cmdline_popup = {
          border = { style = "none", padding = { 1, 2 } },
          win_options = {
            winblend = 5,
            winhighlight = {
              Normal = "NormalFloat",
              FloatBorder = "NoiceCmdlinePopupBorder",
              IncSearch = "",
              Search = "",
            },
            cursorline = false,
          },
        },
      },
      popupmenu = {
        enabled = true,
      },
      routes = {
        { view = "notify",                                      filter = { event = "msg_showmode" } },
        { filter = { event = "msg_show", find = "%d+L, %d+B" }, view = "mini" },
        {
          view = "cmdline_output",
          filter = { cmdline = "^:", min_height = 5 },
          -- BUG: will be fixed after https://github.com/neovim/neovim/issues/21044 gets merged
        },
        { filter = { event = "msg_show", kind = "search_count" },    opts = { skip = true } },
        { filter = { event = "msg_show", find = "; before #" },      opts = { skip = true } },
        { filter = { event = "msg_show", find = "; after #" },       opts = { skip = true } },
        { filter = { event = "msg_show", find = " lines, " },        opts = { skip = true } },
        { filter = { event = "msg_show", find = "go up one level" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "yanked" },          opts = { skip = true } },
        { filter = { find = "No active Snippet" },                   opts = { skip = true } },
        { filter = { find = "waiting for cargo metadata" },          opts = { skip = true } },
      },
      presets = {
        inc_rename = true,
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = "rounded",
      },
    },
  },
  { import = "astrocommunity.indent.indent-blankline-nvim",       enabled = true },
  { import = "astrocommunity.indent.mini-indentscope",            enabled = true },
  { import = "astrocommunity.editing-support.nvim-ts-rainbow2",   enabled = true },
  { import = "astrocommunity.comment.mini-comment",               enabled = true },
  { import = "astrocommunity.syntax.hlargs-nvim",                 enabled = true },
  { import = "astrocommunity.editing-support.todo-comments-nvim", enabled = true },
  { import = "astrocommunity.lsp.inc-rename-nvim",                enabled = true },
  { import = "astrocommunity.motion.mini-bracketed",              enabled = true },
  { import = "astrocommunity.motion.mini-surround",               enabled = true },
  { import = "astrocommunity.diagnostics.trouble-nvim",           enabled = true },
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.mini-ai",                     enabled = true },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.workflow.hardtime-nvim",             enabled = false },
}
