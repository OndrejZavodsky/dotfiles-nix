return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters = {
			prettier = {
				prepend_args = { "--use-tabs", "--single-quote" },
			},
			black = {
				prepend_args = { "--line-length", "88" },
			},
			stylua = {
				prepend_args = { "--indent-type", "Tabs", "--indent-width", "1" },
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort" },
			rust = { "rustfmt" },
			sql = { "sqlfluff" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			java = { "google-java-format" },
		},
	},
}
