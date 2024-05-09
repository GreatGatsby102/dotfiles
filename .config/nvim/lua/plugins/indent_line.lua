return {
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { highlight = { "CursorColumn", "Whitespace" }, char = "" },
			whitespace = {
				highlight = { "CursorColumn", "Whitespace" },
				remove_blankline_trail = false,
			},
			scope = {
				char = "|",
				show_start = false,
				show_end = false,
			},
		},
	},
}
