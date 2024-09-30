-- PLUGIN START 
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Theme
Plug 'Mofiqul/dracula.nvim'
Plug 'daschw/leaf.nvim'
Plug 'catppuccin/nvim'
Plug 'rose-pine/neovim'
Plug 'ribru17/bamboo.nvim'

-- Telescope and dependencies (fuzzy finder)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

-- Language Parser
Plug('nvim-treesitter/nvim-treesitter', {run=':TSUpdate'})

-- LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug('VonHeikemen/lsp-zero.nvim', {branch='v3.x'})

-- Doc support
Plug('kkoomen/vim-doge',{run = ':call doge#install()'})
Plug('vinnymeller/swagger-preview.nvim', {run= 'npm install -g swagger-ui-watcher'})
Plug("iamcco/markdown-preview.nvim", { ["do"] = vim.fn["mkdp#util#install"], ["for"] = { "markdown", "vim-plug" } })

-- Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'jay-babu/mason-nvim-dap.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'mxsdev/nvim-dap-vscode-js'

-- TODO highlighting
Plug 'folke/todo-comments.nvim'

-- Commenting code
Plug 'numToStr/Comment.nvim'

-- Bottom status bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

-- Ui library for rcarriga/nvim-notify
Plug 'MunifTanjim/nui.nvim'

-- Notify messages
Plug 'rcarriga/nvim-notify'

-- Floating Messages
Plug 'folke/noice.nvim'

vim.call('plug#end')
-- PLUGIN END

-- Loading mappings
require('keymaps')

-- Basic Configurations 
vim.opt.guicursor=''
vim.wo.relativenumber=true

-- Remove swap files
vim.cmd('set noswapfile')

-- Space Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Stop use of repeating characters
local discipline = require('discipline')
discipline.cowboy()

-- Keep cursor in the middle of the screen
vim.opt.scrolloff= 999
