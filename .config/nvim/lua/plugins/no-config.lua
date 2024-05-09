return {
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
	-- flash when jumping
	{ "danilamihailov/beacon.nvim" },
	{ "gbprod/substitute.nvim", opts = {} },
	-- Easy motions like
	{ "smoka7/hop.nvim", version = "*", opts = { uppercase_labels = true } },
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	-- Keybind for easy commenting
	"numToStr/Comment.nvim",
	opts = {
		padding = true,
		sticky = true,
		toggler = { line = "gcc", block = "gbc" },
		opleader = { line = "gc", block = "gb" },
		mappings = { basic = true, extra = false },
	},
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
		end,
	},
}
