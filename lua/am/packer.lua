local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- telescope stuff
	use("nvim-lua/popup.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")

	-- lsp
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})
	use("simrat39/symbols-outline.nvim")
	-- use("simrat39/rust-tools.nvim")
	use("rust-lang/rust.vim")
	use("onsails/lspkind-nvim")
	-- formatter
	use("sbdchd/neoformat")

	-- lsp utils
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = false,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("mrjones2014/nvim-ts-rainbow")

	-- primestuff harpoon git worktree
	use("ThePrimeagen/git-worktree.nvim")

    use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
    }

	-- treeshitter
	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate",
	})

	use("romgrk/nvim-treesitter-context")
	use("nvim-treesitter/playground")

	-- commenter
	use("numToStr/Comment.nvim")

	use("echasnovski/mini.nvim")

	-- colorize
	use("norcalli/nvim-colorizer.lua")

	-- git stuff
	-- use("TimUntersberger/neogit")
	use("tpope/vim-fugitive")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("lewis6991/gitsigns.nvim")

	-- undoo tree
	use("mbbill/undotree")

	-- friendly snippets
	use("rafamadriz/friendly-snippets")
	-- color schemes
    use { "ellisonleao/gruvbox.nvim" }

	use("folke/tokyonight.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })

	-- status line
	use("nvim-lualine/lualine.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
