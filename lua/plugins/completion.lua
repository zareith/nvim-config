return {
	{
	  "ibhagwan/fzf-lua",
	  -- optional for icon support
	  dependencies = { "nvim-tree/nvim-web-devicons" },
	  -- or if using mini.icons/mini.nvim
	  -- dependencies = { "nvim-mini/mini.icons" },
	  opts = {}
	},
	{ "smolck/command-completion.nvim" },
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require('Comment').setup()
		end
	}
}
