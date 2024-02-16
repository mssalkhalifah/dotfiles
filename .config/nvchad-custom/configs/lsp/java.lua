---@diagnostic disable: undefined-global
local home = os.getenv("HOME")
-- local jdtls = require("jdtls")

local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

-- File types that signify a Java project's root directory. This will be
-- used by eclipse to determine what constitutes a workspace
local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- eclipse.jdt.ls stores project specific data within a folder. If you are working
-- with multiple different projects, each project must use a dedicated data directory.
-- This variable is used to configure eclipse to use the directory name of the
-- current project found using the root_marker as the folder for project specific data.
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- get the current OS
local os
if vim.fn.has("macunix") then
	os = "mac"
elseif vim.fn.has("win32") then
	os = "win"
else
	os = "linux"
end

-- The on_attach function is used to set key maps after the language server
-- attaches to the current buffer
local on_attach = function(client, bufnr)
	local _, _ = pcall(vim.lsp.codelens.refresh)
	require("plugins.configs.lspconfig").on_attach(client, bufnr)
end

local config = {
	flags = {
		debounce_text_changes = 80,
	},
	on_attach = on_attach, -- We pass our on_attach keybindings to the configuration map
	capabilities = require("plugins.configs.lspconfig").capabilities,
	root_dir = root_dir, -- Set the root directory to our found root_marker
	-- Here you can configure eclipse.jdt.ls specific settings
	-- These are defined by the eclipse.jdt.ls project and will be passed to eclipse when starting.
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
			format = {
				settings = {
					-- Use Google Java style guidelines for formatting
					-- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
					-- and place it in the ~/.local/share/eclipse directory
					url = "/.local/share/eclipse/eclipse-java-google-style.xml",
					profile = "GoogleStyle",
				},
			},
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code
			-- Specify any completion options
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
				filteredTypes = {
					"com.sun.*",
					"io.micrometer.shaded.*",
					"java.awt.*",
					"jdk.*",
					"sun.*",
				},
			},
			-- Specify any options for organizing imports
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			-- How code generation should act
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				hashCodeEquals = {
					useJava7Objects = true,
				},
				useBlocks = true,
			},
			-- If you are developing in projects with different Java versions, you need
			-- to tell eclipse.jdt.ls to use the location of the JDK for your Java version
			-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
			-- And search for `interface RuntimeOption`
			-- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
			-- configuration = {
			-- 	runtimes = {
			-- 		{
			-- 			name = "JavaSE-17",
			-- 			path = home .. "/.asdf/installs/java/corretto-17.0.4.9.1",
			-- 		},
			-- 		{
			-- 			name = "JavaSE-11",
			-- 			path = home .. "/.asdf/installs/java/corretto-11.0.16.9.1",
			-- 		},
			-- 		{
			-- 			name = "JavaSE-1.8",
			-- 			path = home .. "/.asdf/installs/java/corretto-8.352.08.1",
			-- 		},
			-- 	},
			-- },
		},
	},
	-- cmd is the command that starts the language server. Whatever is placed
	-- here is what is passed to the command line to execute jdtls.
	-- Note that eclipse.jdt.ls must be started with a Java version of 17 or higher
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	-- for the full list of options
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		-- If you use lombok, download the lombok jar and place it in ~/.local/share/eclipse
		"-javaagent:"
			.. home
			.. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",

		-- The jar file is located where jdtls was installed. This will need to be updated
		-- to the location where you installed jdtls
		"-jar",
		vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),

		-- The configuration for jdtls is also placed where jdtls was installed. This will
		-- need to be updated depending on your environment
		"-configuration",
		"/opt/homebrew/Cellar/jdtls/1.18.0/libexec/config_" .. os,

		-- Use the workspace_folder defined above to store data for this project
		"-data",
		workspace_folder,
	},
}

-- Finally, start jdtls. This will run the language server using the configuration we specified,
-- setup the keymappings, and attach the LSP client to the current buffer
jdtls.start_or_attach(config)

-- -- more space in the neovim command line for displaying messages
-- -- use this function notation to build some variables
-- -- vim.opt_local.shiftwidth = 4
-- -- vim.opt_local.tabstop = 4
-- -- vim.opt_local.softtabstop = 4
-- -- vim.opt_local.ts = 4
-- -- vim.opt_local.expandtab = true
--
-- local status, jdtls = pcall(require, "jdtls")
-- if not status then
-- 	return
-- end
--
-- local function directory_exists(path)
-- 	local f = io.popen("cd " .. path)
-- 	local ff = f:read("*all")
--
-- 	if ff:find("ItemNotFoundException") then
-- 		return false
-- 	else
-- 		return true
-- 	end
-- end
--
-- local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
-- local root_dir = require("jdtls.setup").find_root(root_markers)
--
-- -- calculate workspace dir
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
-- if directory_exists(workspace_dir) then
-- else
-- 	os.execute("mkdir " .. workspace_dir)
-- end
-- -- get the mason install path
-- local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
--
-- -- get the current OS
-- local os
-- if vim.fn.has("macunix") then
-- 	os = "mac"
-- elseif vim.fn.has("win32") then
-- 	os = "win"
-- else
-- 	os = "linux"
-- end
--
-- local bundles = {}
-- local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
-- vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
-- vim.list_extend(
-- 	bundles,
-- 	vim.split(
-- 		vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
-- 		"\n"
-- 	)
-- )
--
-- local config = {
-- 	cmd = {
-- 		"java",
-- 		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
-- 		"-Dosgi.bundles.defaultStartLevel=4",
-- 		"-Declipse.product=org.eclipse.jdt.ls.core.product",
-- 		"-Dlog.protocol=true",
-- 		"-Dlog.level=ALL",
-- 		"-javaagent:" .. install_path .. "/lombok.jar",
-- 		"-Xms1g",
-- 		"--add-modules=ALL-SYSTEM",
-- 		"--add-opens",
-- 		"java.base/java.util=ALL-UNNAMED",
-- 		"--add-opens",
-- 		"java.base/java.lang=ALL-UNNAMED",
-- 		"-jar",
-- 		vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
-- 		"-configuration",
-- 		install_path .. "/config_" .. os,
-- 		"-data",
-- 		workspace_dir,
-- 	},
-- 	capabilities = require("plugins.configs.lspconfig").capabilities,
-- 	on_attach = on_attach,
-- 	root_dir = root_dir,
-- 	settings = {
-- 		java = {},
-- 	},
--
-- 	init_options = {
-- 		bundles = {
-- 			vim.fn.glob(
-- 				mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
-- 				"\n"
-- 			),
-- 		},
-- 	},
-- }
--
-- config["on_attach"] = function(client, bufnr)
-- 	local _, _ = pcall(vim.lsp.codelens.refresh)
-- 	require("plugins.configs.lspconfig").on_attach(client, bufnr)
-- end
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	pattern = { "*.java" },
-- 	callback = function()
-- 		local _, _ = pcall(vim.lsp.codelens.refresh)
-- 	end,
-- })
--
-- jdtls.start_or_attach(config)
--
-- vim.cmd([[command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)]])
