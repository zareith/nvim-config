return {
	{ "smolck/command-completion.nvim" },
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require('Comment').setup()
		end
	}
}
