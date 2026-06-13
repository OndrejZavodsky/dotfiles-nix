return {
	{
		"mrcjkb/rustaceanvim",
		version = "^9",
		lazy = false,
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {},
	},
}
