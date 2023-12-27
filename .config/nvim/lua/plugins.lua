local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = require('setup/nvim-tree').config
  },

  -- Fuzzy search
  'junegunn/fzf',
  {
    'junegunn/fzf.vim',
    config = require('setup/fzf').config
  },

  -- Bufferline
  {
    'akinsho/bufferline.nvim', version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = require("setup/bufferline").config
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = require('setup/lualine').config
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  },

  -- Color
  'folke/tokyonight.nvim',
  {
    'dracula/vim',
    name="dracula",
    config = function() vim.cmd("colorscheme dracula") end
  },
  'HiPhish/rainbow-delimiters.nvim',

  -- Completion
  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = require('setup/coc').config
  },

  -- Syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = require('setup/nvim-treesitter').config
  },

  -- Command prompt
  {
    'gelguy/wilder.nvim',
    event = 'CmdLineEnter',
    config = require('setup/wilder').config
  },

  -- Input Method (im)
  {
    'Zhniing/im-select.nvim',
    branch = 'feat',
    config = require('setup/im-select').config
  },

  -- Git signs
  {
    'lewis6991/gitsigns.nvim',
    config = require('setup/gitsigns').config
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    config = require("setup/markdown-preview").config,
    ft = { "markdown" },  -- Lazy-load on filetype
  },

  -- Competitive programming
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = require('setup/competitest').config,
  },

  -- Debug
  {
    "mfussenegger/nvim-dap",
    config = require("setup/nvim-dap").config,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = require("setup/nvim-dap-ui").config,
  },

  -- Float terminal
  {
    "voldikss/vim-floaterm",
    config = require("setup/vim-floaterm").config,
  },

  -- Surroundings
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "roobert/surround-ui.nvim",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    opts = {
      root_key = "s",  -- Triggered by <leader>s
    }
  },

  -- Keymap hint
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function ()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },

  -- Web broswer embedded
  {
    'glacambre/firenvim',
    lazy = not vim.g.started_by_firenvim,
    build = function ()
      vim.fn["firenvim#install"](0)
    end
  },

  -- Miscellaneous
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime"
  },
})
