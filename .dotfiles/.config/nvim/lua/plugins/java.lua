return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = function()
			local bundles = {}

			-- add java-debug-adapter
			local mason_path = vim.fn.stdpath("data") .. "/mason"
			vim.list_extend(
				bundles,
				vim.split(vim.fn.glob(mason_path .. "/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar"), "\n")
			)

			local config = {
				cmd = { mason_path .. "/bin/jdtls" },
				root_dir = vim.fs.dirname(
					vim.fs.find({ "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" }, { upward = true })[1]
				),
				init_options = {
					bundles = bundles,
				},
				settings = {
					java = {
						configuration = {
							updateBuildConfiguration = "interactive",
						},
						eclipse = { downloadSources = true },
						maven = { downloadSources = true },
						implementationsCodeLens = { enabled = true },
						referencesCodeLens = { enabled = true },
					},
				},
			}
			require("jdtls").start_or_attach(config)
		end,
	},
}
