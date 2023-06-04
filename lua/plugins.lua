require "helpers/globals"

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require "ext.tokyonight"
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "jay-babu/mason-nvim-dap.nvim",
      "rcarriga/nvim-dap-ui"
      -- "p00f/clangd_extensions.nvim",
    },
    config = function()
      require "ext.mason"
      require "ext.dap"
    end
  },
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require "ext.cmp"
    end
  },
  {
    'onsails/lspkind-nvim',
    lazy = true,
    config = function()
      require "ext.lspkind"
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "ext.treesitter"
    end
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require "ext.autopairs"
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require "ext.telescope"
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require "ext.neotree"
    end
  },
  {
    "folke/which-key.nvim",
    lazy = true,
    config = function()
      require("ext.whichkey")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require("ext.lualine")
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("ext.colorizer")
    end
  },
}
