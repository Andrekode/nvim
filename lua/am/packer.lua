return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- telescope stuff
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")
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
	-- null ls
	--	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
				},
			})
		end,
		requires = { { "nvim-tree/nvim-web-devicons" } },
	})
	use("simrat39/symbols-outline.nvim")
	use("simrat39/rust-tools.nvim")
    use('rust-lang/rust.vim')
	use("onsails/lspkind-nvim")
	-- formatter
	use("sbdchd/neoformat")

	-- lsp utils

	-- primestuff harpoon git worktree
	use("ThePrimeagen/git-worktree.nvim")
	use("ThePrimeagen/harpoon")

	-- treeshitter
	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")

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
	use("gruvbox-community/gruvbox")
	use("folke/tokyonight.nvim")

	-- status line
	use("nvim-lualine/lualine.nvim")
end)
