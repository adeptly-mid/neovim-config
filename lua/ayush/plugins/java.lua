return {
	"mfussenegger/nvim-jdtls",
	ft = { "java" },
	config = function()
		local jdtls = require("jdtls")
		local home = os.getenv("HOME")

		-- Use project directory name as unique workspace folder
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

		-- Prevent re-attaching if already attached to avoid memory bloat
		if vim.b.did_jdtls_setup then
			return
		end
		vim.b.did_jdtls_setup = true

		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g", -- Set max heap memory
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				vim.fn.glob(
					home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
				),
				"-configuration",
				home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
				"-data",
				workspace_dir,
			},
			root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),
			settings = {
				java = {
					symbols = {
						includeSourceMethodDeclarations = true,
					},
				},
			},
			single_file_support = false,
		}

		jdtls.start_or_attach(config)
	end,
}
