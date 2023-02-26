local execute = vim.api.nvim_command
local fn = vim.fn

local packer = nil
local function init()
  if packer == nil then
    packer = require("packer")
    packer.init({
      git = {
        cmd = "git", -- The base command for git operations
        subcommands = { -- Format strings for git subcommands
          update = "pull --ff-only --progress --rebase=false",
          install = "clone --depth %i --no-single-branch --progress",
          fetch = "fetch --depth 999999 --progress",
          checkout = "checkout %s --",
          update_branch = "merge --ff-only @{u}",
          current_branch = "branch --show-current",
          diff = "log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD",
          diff_fmt = "%%h %%s (%%cr)",
          get_rev = "rev-parse --short HEAD",
          get_msg = "log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1",
          submodules = "submodule update --init --recursive --progress",
        },
        depth = 1, -- Git clone depth
        clone_timeout = 60, -- Timeout, in seconds, for git clones
        default_url_format = "https://github.com/%s", -- Lua format string used for "aaa/bbb" style plugins
      },
    })
  end

  local use = packer.use
  packer.reset()
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({ "kevinhwang91/nvim-bqf", ft = "qf" })

  use("navarasu/onedark.nvim")

  use("olimorris/onedarkpro.nvim")

  use("marko-cerovac/material.nvim")

  -- Fzf integration
  use("junegunn/fzf.vim")

  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("plugins.telescope")
    end,
  })

  use({
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require("telescope").load_extension("project")
    end,
  })

  use({
    "AckslD/nvim-neoclip.lua",
    requires = {
      -- you'll need at least one of these
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("neoclip").setup()
      require("telescope").load_extension("neoclip")
    end,
  })

  -- Themes / icons
  use("rakr/vim-one")
  use("vim-airline/vim-airline-themes")
  use({ "kyazdani42/nvim-web-devicons" })
  use({
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("plugins.catpuccin")
    end,
  })

  use({
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "storm",
      })
    end,
  })

  -- Easier replacements in nvim
  use("svermeulen/vim-subversive")

  -- Ranger integration
  use("kevinhwang91/rnvimr")

  use({ "github/copilot.vim", disable = false })

  -- Automatic rooting
  use("airblade/vim-rooter")

  -- Git integration
  use("tpope/vim-fugitive")

  use("tpope/vim-surround")

  -- Better motion: camelCase_Test
  --                w -> w -> w
  use("chaoren/vim-wordmotion")

  -- Status line, top bars
  use({
    "vim-airline/vim-airline",
    disable = true,
  })

  -- use {
  --   'romgrk/barbar.nvim',
  --   requires = {'kyazdani42/nvim-web-devicons'},
  --   config = function()
  --     require('plugins.barbar')
  --   end

  -- }

  use({
    "hoob3rt/lualine.nvim",
    config = function()
      require("plugins.lualine")
    end,
  })

  use({
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.bufferline")
    end,
  })

  -- use ({
  --   'akinsho/nvim-bufferline.lua',
  --   config = function()
  --     require('plugins.bufferline')
  --   end
  -- })

  -- Better navigation
  use({
    "phaazon/hop.nvim",
    as = "hop",
    config = function()
      require("plugins.hop")
    end,
  })
  -- use('unblevable/quick-scope')

  -- Comment stuff out
  use({
    "b3nj5m1n/kommentary",
    config = function()
      require("kommentary.config").configure_language("lua", {
        prefer_single_line_comments = true,
      })
    end,
  })

  use({
    "matze/vim-move",
    config = function()
      require("plugins.vim-move")
    end,
  })

  -- use({
  --   'nvim-telescope/telescope.nvim',
  --   requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
  --   config = function()
  --     require('plugins.telescope')
  --   end,
  -- })

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.nvim-autopair")
    end,
  })

  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.nvim-treesitter")
    end,
  })

  use({
    "nvim-treesitter/playground",
    cmd = "TSPlayground",
  })

  use({
    "p00f/nvim-ts-rainbow",
  })

  use({
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        autotag = {
          enable = true,
        },
      })
    end,
    --[[ event = 'BufRead',
    requires = 'nvim-treesitter', ]]
  })

  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.gitsigns")
    end,
  })

  -- use({
  --   'kyazdani42/nvim-tree.lua',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = function()
  --     require('plugins.nvim-tree')
  --   end,
  -- })

  -- color highlighter for Neovim
  use({
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup()
    end,
  })

  -- Plugin development
  use("folke/neodev.nvim")

  -- Completion and linting
  use({
    "neovim/nvim-lspconfig",
    "folke/trouble.nvim",
    "ray-x/lsp_signature.nvim",
    {
      "kosayoda/nvim-lightbulb",
    },
  })

  -- Snippets
  use({
    {
      "L3MON4D3/LuaSnip",
      opt = true,
    },
    "rafamadriz/friendly-snippets",
  })

  -- Completion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind.nvim",
      { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      "lukas-reineke/cmp-under-comparator",
      { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
    },
    config = [[require('plugins.cmp')]],
    event = "InsertEnter",
    wants = "LuaSnip",
  })

  -- C++
  use("p00f/clangd_extensions.nvim")

  use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" } })

  use({
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        popupmenu = {
          enabled = false, -- enables the Noice popupmenu UI
          ---@type 'nui'|'cmp'
          backend = "nui", -- backend to use to show regular cmdline completions
          ---@type NoicePopupmenuItemKind|false
          -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
          kind_icons = {}, -- set to `false` to disable icons
          opts = {
            size = { width = 20, height = 10 },
          },
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = true,
            view = nil, -- when nil, use defaults from documentation
            ---@type NoiceViewOptions
            opts = {
              size = { width = 20, height = 10 },
            }, -- merged with defaults from documentation
          },
          -- defaults for hover and signature help
          documentation = {
            view = "popup",
            ---@type NoiceViewOptions
            opts = {
              size = { width = 20, height = 10 },
            }, -- merged with defaults from documentation
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = false, -- position the cmdline and popupmenu together
          long_message_to_split = false, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      })
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  })
  -- use({
  --   'neoclide/coc.nvim',
  --   branch = 'release',
  --   commit = 'cb336318abe0fb2e125731201d0df029abce0b39'
  -- })

  -- vscode-like pictograms for neovim
  -- lsp completion items
  use({
    "onsails/lspkind-nvim",
    event = "BufRead",
    config = function()
      require("plugins.lspkind")
    end,
  })

  -- Change case type
  -- crs (coerce to snake_case).
  -- MixedCase (crm),
  -- camelCase (crc),
  -- snake_case (crs),
  -- UPPER_CASE (cru),
  -- dash-case (cr-),
  -- dot.case (cr.),
  -- space case (cr<space>),
  -- and Title Case (crt)
  use({ "tpope/vim-abolish" })

  -- Some other useful plugins
  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location
  -- lists below
  -- use({
  -- 'folke/trouble.nvim',
  -- requires = 'kyazdani42/nvim-web-devicons',
  -- config = function()
  -- require('trouble').setup({})
  -- end,
  -- })

  -- use('rafamadriz/friendly-snippets')
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
