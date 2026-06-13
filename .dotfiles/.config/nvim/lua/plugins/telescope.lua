return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			enabled = true,
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		require("telescope").setup({})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
	end,
}
