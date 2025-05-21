return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,
	},
	{
		"vim-airline/vim-airline",
		lazy = false
	},
	{
		"gbrlsnchs/winpick.nvim",
		lazy = false
	},
	{
		"ctrlpvim/ctrlp.vim",
		lazy = false
	},
	{
		"duane9/nvim-rg",
		lazy = false
	},
	{
		"gelguy/wilder.nvim",
		lazy = false,
		config = function()
			local wilder = require('wilder')
			wilder.setup({ modes = { ':', '/', '?' } })
		end
	},
	{
		'MagicDuck/grug-far.nvim',
		lazy = false,
		-- grug-far.lua defers all it's requires so it's lazy by default
		-- additional lazy config to defer loading is not really needed...
		config = function()
			require('grug-far').setup({
				-- options, see Configuration section below
				-- there are no required options atm
			});
		end
	},
}
