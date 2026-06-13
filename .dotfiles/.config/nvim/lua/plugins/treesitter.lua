return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "lua", "rust", "python", "sql", "java" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
