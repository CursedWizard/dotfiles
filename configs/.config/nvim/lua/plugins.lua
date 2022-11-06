local execute = vim.api.nvim_command
local fn = vim.fn

vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'kevinhwang91/nvim-bqf', ft = 'qf'}

  use 'navarasu/onedark.nvim'

  -- Fzf integration
  use('junegunn/fzf.vim')

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('plugins.telescope')
    end
  }

  use {
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require"telescope".load_extension("project")
    end,
  }

  use {
  "AckslD/nvim-neoclip.lua",
  requires = {
    -- you'll need at least one of these
    {'nvim-telescope/telescope.nvim'},
  },
  config = function()
    require('neoclip').setup()
    require"telescope".load_extension("neoclip")
  end,
}

  -- Themes / icons
  use('rakr/vim-one')
  use('vim-airline/vim-airline-themes')
  use({'kyazdani42/nvim-web-devicons'})

  -- Easier replacements in nvim
  use("svermeulen/vim-subversive")

  -- Ranger integration
  use('kevinhwang91/rnvimr')

  use({'github/copilot.vim', disable = false})

  -- Automatic rooting
  use('airblade/vim-rooter')

  -- Git integration
  use('tpope/vim-fugitive')

  use('tpope/vim-surround')

  -- Better motion: camelCase_Test
  --                w -> w -> w
  use('chaoren/vim-wordmotion')

  -- Status line, top bars
  use({'vim-airline/vim-airline',
    disable = true
  })


  -- use {
  --   'romgrk/barbar.nvim',
  --   requires = {'kyazdani42/nvim-web-devicons'},
  --   config = function()
  --     require('plugins.barbar')
  --   end

  -- }

  use({
    'hoob3rt/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end
  })

  use {'akinsho/bufferline.nvim', tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.bufferline')
    end
  }

  -- use ({
  --   'akinsho/nvim-bufferline.lua',
  --   config = function()
  --     require('plugins.bufferline')
  --   end
  -- })


  -- Better navigation
  use ({
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      require('plugins.hop')
    end
  })
  -- use('unblevable/quick-scope')

  -- Comment stuff out
  use({'b3nj5m1n/kommentary',
  config = function()
    require('kommentary.config').configure_language("lua", {
      prefer_single_line_comments = true,
    })
    end
  })

  use({
    'matze/vim-move',
    config = function()
      require('plugins.vim-move')
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
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.nvim-autopair')
    end,
  })

  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup({})
    end,
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.nvim-treesitter')
    end,
  })

  use({
    'nvim-treesitter/playground',
    cmd = 'TSPlayground',
  })

  use({
    'p00f/nvim-ts-rainbow',
  })

  use({
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({
        autotag = {
          enable = true,
        }
      })
    end,
    --[[ event = 'BufRead',
    requires = 'nvim-treesitter', ]]
  })


  use({
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('plugins.gitsigns')
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
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require('colorizer').setup()
    end,
  })

  use({
    'neoclide/coc.nvim',
    branch = 'release',
    commit = 'cb336318abe0fb2e125731201d0df029abce0b39'
  })

  -- vscode-like pictograms for neovim
  -- lsp completion items
  use({
    'onsails/lspkind-nvim',
    event = 'BufRead',
    config = function()
      require('plugins.lspkind')
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
  use({"tpope/vim-abolish"})


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


end)
