return {
    "mfussenegger/nvim-jdtls",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    ft = { "java" },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local config = {
            cmd = {
                "java",
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.protocol=true",
                "-Dlog.level=ALL",
                "-Xmx1g",
                "--add-modules=ALL-SYSTEM",
                "--add-opens",
                "java.base/java.util=ALL-UNNAMED",
                "--add-opens",
                "java.base/java.lang=ALL-UNNAMED",
                "-jar",
                "/home/home/.xdg/local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.800.v20240330-1250.jar",
                "-configuration",
                "/home/home/.xdg/local/share/nvim/mason/packages/jdtls/config_linux",
                "-data",
                vim.fn.expand("~/.xdg/cache/jdtls/workspace") .. project_name,
            },
            root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
            settings = {
                java = {},
            },
            init_options = {
                bundles = {"/usr/share/java-debug/com.microsoft.java.debug.plugin.jar","/usr/share/java-debug/com.microsoft.java.debug.core.jar"},
            },
            capabilities = capabilities,
        }
        require("jdtls").start_or_attach(config)
    end,
}

-- return {
--     "mfussenegger/nvim-jdtls",
--     dependencies = {
--         "mfussenegger/nvim-dap",
--     },
-- }
--     opts = {},
--     config = function()
--         local config = {
--             cmd = { "/home/asbel/.xdg/local/share/nvim/mason/bin/jdtls" },
--             root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
--             -- bundles = {
--             --     vim.fn.glob("/usr/share/java-debug/com.microsoft.java.debug.plugin.jar", true),
--             -- },
--         }
--         require("jdtls").start_or_attach(config)
--     end,
--     enabled = true,
--     event = "VeryLazy",
-- require("jdtls").start_or_attach({
--     -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
--     -- The command that starts the language server
--     -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--     cmd = {
--         "java",
--         "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--         "-Dosgi.bundles.defaultStartLevel=4",
--         "-Declipse.product=org.eclipse.jdt.ls.core.product",
--         "-Dlog.protocol=true",
--         "-Dlog.level=ALL",
--         "-Xmx1g",
--         "--add-modules=ALL-SYSTEM",
--         "--add-opens",
--         "java.base/java.util=ALL-UNNAMED",
--         "--add-opens",
--         "java.base/java.lang=ALL-UNNAMED",
--         "-jar",
--         "/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar",
--         "/home/home/.xdg/local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher_1.6.800.v20240330-1250.jar",
--         "-configuration",
--         "/home/home/.xdg/local/share/nvim/mason/share/jdtls/config/config.ini",
--         "-data",
--         "/path/to/unique/per/project/workspace/folder",
--     },

--     -- This is the default if not provided, you can remove it. Or adjust as needed.
--     -- One dedicated LSP server & client will be started per unique root_dir
--     --
--     -- vim.fs.root requires Neovim 0.10.
--     -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
--     root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

--     -- Here you can configure eclipse.jdt.ls specific settings
--     -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--     -- for a list of options
--     settings = {
--         java = {},
--     },

--     -- Language server `initializationOptions`
--     -- You need to extend the `bundles` with paths to jar files
--     -- if you want to use additional eclipse.jdt.ls plugins.
--     --
--     -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
--     --
--     -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
--     init_options = {
--         bundles = {},
--     },
-- })
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
-- require('jdtls').start_or_attach(config)
