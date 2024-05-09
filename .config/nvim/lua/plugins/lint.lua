return {

	{ -- Linting
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile", "InsertLeave" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				markdown = { "markdownlint" },
				checkstyle = { "checkstyle" },
				cppcheck = { "cppcheck" },
				zsh = { "zsh" },
			}

			--   json = { "jsonlint" },
			--   markdown = { "vale" },
			--   text = { "vale" }
			-- }
			--
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
