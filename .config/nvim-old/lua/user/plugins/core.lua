return {
  -- disable
  { "bufdelete.nvim",                  enabled = true },
  { "better-escape.nvim",              enabled = true },
  { "mason.nvim",                      opts = { PATH = "append" } },
  { "theHamsta/nvim-dap-virtual-text", opts = {} },
  { "which-key.nvim",                  opts = { window = { winblend = 20 } } },
  {
    "astrotheme",
    opts = {
      highlights = { global = { modify_hl_groups = function(hl) hl.Comment.italic = true end } },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = {
        "*",
        cmp_docs = { always_update = true },
        cmp_menu = { always_update = true },
      },
      user_default_options = {
        mode = "virtualtext",
        tailwind = true,
      },
    },
  },
  {
    "nvim-notify",
    opts = {
      stages = "slide",
      timeout = 3000,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
    },
  },
  {
    "lspkind.nvim",
    opts = function(_, opts)
      -- use codicons preset
      opts.preset = "codicons"
      -- set some missing symbol types
      opts.symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        String = "",
      }
      return opts
    end,
  },
  {
    "heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"
      opts.statusline[9] = status.component.lsp { lsp_progress = false }
      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        status.component.git_branch(),
        status.component.diagnostics { padding = { left = 0 } },
        status.component.file_info {
          file_icon = { padding = { left = 0 } },
          filename = false,
          padding = { left = 0 },
        },
        status.component.separated_path {
          padding = { left = 0 },
          path_func = status.provider.filename { modify = ":.:h" },
        },
        status.component.file_info {
          file_icon = false,
          file_modified = false,
          padding = { left = 0 },
        },
        status.component.breadcrumbs {
          icon = { hl = true },
          prefix = false,
          padding = { left = 0 },
        },
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.git_diff {
          padding = { right = 0 },
        },
        status.component.nav {
          padding = {
            left = 0,
            right = 0,
          },
          surround = {
            separator = "right",
          },
        },
      }
      opts.tabline[2] = status.heirline.make_buflist(status.component.tabline_file_info { close_button = false })
      opts.winbar = nil
    end,
  },
  {
    "nvim-treesitter",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-context", config = true },
    },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      auto_install = vim.fn.executable "tree-sitter" == 1,
      highlight = { disable = { "help", "latex" } },
      indent = { enable = true },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    event = "InsertEnter",
    dependencies = {
      -- snippets
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
          config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
        },
        opts = {
          history = true,
          delete_check_events = "TextChanged",
        },
      },
    },
    opts = function(_, opts)
      local cmp = require "cmp"

      local luasnip = require "luasnip"
      local function next_item()
        if cmp.visible() then
          cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
        else
          cmp.complete()
        end
      end
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      return require("astronvim.utils").extend_tbl(opts, {
        sources = cmp.config.sources {
          { name = "nvim_lsp",          priority = 1000 },
          { name = "luasnip",           priority = 750 },
          { name = "pandoc_references", priority = 725 },
          { name = "emoji",             priority = 700 },
          { name = "calc",              priority = 650 },
          { name = "path",              priority = 500 },
          { name = "buffer",            priority = 250 },
        },
        mapping = {
          ["<C-n>"] = next_item,
          ["<C-j>"] = next_item,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      })
    end,
  },
  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}
