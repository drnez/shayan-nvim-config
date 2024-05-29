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

local plugins = {
    {
    	'nvim-telescope/telescope.nvim', tag = '0.1.5',
      	dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'navarasu/onedark.nvim',
    {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate"
    },
    -- LSP Zero
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    -- end LSP Zero
    'FotiadisM/tabset.nvim',
    {'folke/trouble.nvim', dependencies = {
        'nvim-tree/nvim-web-devicons'
        }
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = true,
    },
    {
        'vimwiki/vimwiki'
    },
    {'akinsho/git-conflict.nvim', version = "*", config = true}
}

local opts = {}

require("lazy").setup(plugins, opts)
