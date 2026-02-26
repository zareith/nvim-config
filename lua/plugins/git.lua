return {
	{"tpope/vim-fugitive"},
	{
	  "pwntester/octo.nvim",
	  cmd = "Octo",
	  opts = {
		-- or "fzf-lua" or "snacks" or "default"
		picker = "fzf-lua",
		-- bare Octo command opens picker of commands
		enable_builtin = true,
	  },
	  keys = {
		{
		  "<leader>ghi",
		  "<CMD>Octo issue list<CR>",
		  desc = "List GitHub Issues",
		},
		{
		  "<leader>ghpr",
		  "<CMD>Octo pr list<CR>",
		  desc = "List GitHub PullRequests",
		},
		{
		  "<leader>os",
		  function()
			require("octo.utils").create_base_search_command { include_current_repo = true }
		  end,
		  desc = "Search GitHub",
		},
	  },
	  dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
		"nvim-tree/nvim-web-devicons",
	  },
	}
}
