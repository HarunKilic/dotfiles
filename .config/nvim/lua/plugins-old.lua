require "helpers/globals"

return {
  -- MASON {{{
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      require "extensions.mason"
    end
  },
  -- }}}

  -- NEO TREE {{{
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim"
      },
      config = function()
        require "extensions.neotree"
      end
    },
  -- }}}

  -- Telescore {{{
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require "extensions.telescope"
    end
  },

  -- }}}

-- CMP {{{
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "rafamadriz/friendly-snippets"
    },
    config = function()
      require "extensions.cmp"
    end
  },

-- }}}

-- LSP Kind {{{
  {
    "onsails/lspkind-nvim",
    lazy = true,
    config = function()
      require "extensions.lspkind"
    end
  },

-- }}}

-- Git Signs {{{
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require "extensions.gitsigns"
    end
  },

-- }}}

-- Trouble {{{
  {
    "folke/trouble.nvim",
    lazy = true,
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require "extensions.trouble"
    end
  },
-- }}}

-- TreeSitter {{{
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "extensions.treesitter"
    end
  },

-- }}}

-- Flash Nvim {{{
  {
    "folke/flash.nvim",
    event = "VeryLazy",
  keys = {
    {
    "s",
    mode = {"n", "x", "o"},
    function()
      require("flash").jump()
    end,
    },
    {
    "S",
    mode = {"n", "x", "o" },
    function()
      require("flash").treesitter()
    end

  }
  },
    config = function()
     -- require "extensions.flash"
    end
  },
-- }}}

-- Comment {{{
  {
    "numToStr/Comment.nvim",
    lazy = true,
    config = function()
      require "extensions/comment"
    end
  },
-- }}}

-- Which Key {{{
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require "extensions/whichkey"
    end
  },
-- }}}

-- Auto Pairs {{{
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "extensions/autopairs"
    end
  },
-- }}}




  -- Theme: Sonokai {{{
  {
    "sainnhe/sonokai",
    lazy = false,
    config = function() 
      require "extensions.colorscheme.sonokai"
    end
  }
  -- }}}
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
