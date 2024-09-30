-- PLUGIN START 
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Theme
Plug 'Mofiqul/dracula.nvim'
Plug 'daschw/leaf.nvim'
Plug 'catppuccin/nvim'

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

-- Theme Configuration
require("leaf").setup({
    underlineStyle = "underline",
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    transparent = true,
    colors = {},
    overrides = {},
    theme = "auto", -- default, based on vim.o.background, alternatives: "light", "dark"
    contrast = "low", -- default, alternatives: "medium", "high"
})
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

vim.cmd('colorscheme catppuccin')


-- Keep cursor in the middle of the screen
vim.opt.scrolloff= 999
