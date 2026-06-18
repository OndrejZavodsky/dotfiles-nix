return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		local conform = require("conform")

		local opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
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
		}

		for _, formatters in pairs(opts.formatters_by_ft) do
			for _, formatter_name in ipairs(formatters) do
				opts.formatters[formatter_name] = opts.formatters[formatter_name] or {}

				opts.formatters[formatter_name].command = formatter_name

				opts.formatters[formatter_name].condition = function()
					return vim.fn.executable(formatter_name) == 1
				end
			end
		end

		conform.setup(opts)
	end,
}
