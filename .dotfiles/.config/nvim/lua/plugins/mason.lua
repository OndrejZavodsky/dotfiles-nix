return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason.nvim" },
	opts = {
		ensure_installed = {
			-- formatters
			--	"stylua",
			--	"black",
			--	"isort",
			--	"sqlfluff",
			--	"prettier",
			-- lsp
			"rust-analyzer",
			--			"pyright",
			--			"sqlls",
			"jdtls",
			--	"java-debug-adapter",
			--"java-test",
			"google-java-format",
		},
	},
}
