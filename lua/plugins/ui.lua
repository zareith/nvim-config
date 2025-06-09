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
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup({
                auto_set_mode_filetype_allowlist = {
                    "asciidoc",
                    "gitcommit",
                    "latex",
                    "mail",
                    "markdown",
                    "rst",
                    "tex",
                    "text",
                },
            })
        end
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
    {
        "vim-scripts/copypath.vim"
    },
    {
        "phaazon/hop.nvim",
        lazy = false,
        cmd = {
            "HopWord",
            "HopLine",
            "HopChar1",
            "HopChar2",
            "HopPattern"
        },
        config = function()
            require 'hop'.setup()
        end
    },
    {
        "mg979/vim-visual-multi",
        lazy = false,
        event = "BufRead"
    },
    {
        "qpkorr/vim-bufkill",
        event = "BufRead",
        cmd = {
            "BUN",
            "BD",
            "BW",
            "BB",
            "BF",
            "BA"
        }
    },
    {
        "mbbill/undotree",
        cmd = {
            "UndotreeToggle"
        }
    },
    {
        "gpanders/editorconfig.nvim",
    },
}
