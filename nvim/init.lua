-- PLUGIN START 
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Theme
Plug 'Mofiqul/dracula.nvim'
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

vim.call('plug#end')

-- PLUGIN END

-- Loading mappings
require('keymaps')

-- Basic Configurations 
vim.opt.guicursor=''
vim.wo.relativenumber=true

-- Space Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Theme Configuration
require('dracula').setup({
	transparent_bg = true
})
vim.cmd('colorscheme dracula')

-- Keep cursor in the middle of the screen
vim.opt.scrolloff= 999
