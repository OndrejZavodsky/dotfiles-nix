return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = function()
			local home = os.getenv("HOME")
			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

			local bundles = {}
			local nix_debug_path = "/run/current-system/sw/share/java-debug-adapter"

			if vim.fn.empty(vim.fn.glob(nix_debug_path)) == 0 then
				vim.list_extend(bundles, vim.split(vim.fn.glob(nix_debug_path .. "/com.microsoft.java.debug.plugin-*.jar"), "\n"))
			else
				local mason_path = vim.fn.stdpath("data") .. "/mason"
				vim.list_extend(
					bundles,
					vim.split(vim.fn.glob(mason_path .. "/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar"), "\n")
				)
			end

			local config = {
				cmd = { "jdtls", "-data", workspace_dir },

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
