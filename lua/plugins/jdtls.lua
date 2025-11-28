return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = "/home/asbel/.xdg/local/state/jdtls/" .. project_name

        local java_home = "/usr/lib/jvm/java-21-openjdk"
        local java_command = java_home .. "/bin/java"
        local jdtls_home = "/home/asbel/apps/jdtls"
        local jdtls_launcher = jdtls_home .. "/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar"
        local jdtls_config = jdtls_home .. "/config_linux"

        local config = {
            cmd = {
                java_command,
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.protocol=true",
                "-Dlog.level=ERROR",
                "-Xmx1g",
                "--add-modules=ALL-SYSTEM",
                "--add-opens",
                "java.base/java.util=ALL-UNNAMED",
                "--add-opens",
                "java.base/java.lang=ALL-UNNAMED",
                "-jar",
                jdtls_launcher,
                "-configuration",
                jdtls_config,
                "-data",
                workspace_dir,
            },

            root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

            -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
            settings = {
                java = {
                    foldingRange = { enabled = true },
                    signatureHelp = { enabled = true, description = { enabled = true } },
                    format = { enabled = false },
                    rename = { enabled = true },
                    jdt = {
                        ls = {
                            lombokSupport = true,
                            androidSupport = false,
                            protoBufSupport = false,
                        },
                    },
                    configuration = {
                        runtimes = {
                            {
                                name = "OpenJDK-21",
                                path = "/lib/jvm/java-21-openjdk",
                            },
                            {
                                name = "GraalVM-21",
                                path = "/lib/jvm/java-21-graalvm",
                            },
                        },
                    },
                },
            },

            -- https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
            init_options = {
                extendedClientCapabilities = require("jdtls").extendedClientCapabilities,
                bundles = {
                    -- INFO: to install java-debug
                    -- git clone https://github.com/microsoft/java-debug
                    -- cd java-debug
                    -- ./mvnw clean install
                    --
                    -- https://github.com/microsoft/java-debug
                    -- "path/to/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-<version>.jar",
                    -- https://github.com/mfussenegger/nvim-jdtls
                    -- vim.fn.glob("path/to/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
                },
            },
        }
        local opts = {}
        vim.keymap.set("n", "<leader>ji", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
        vim.keymap.set("n", "<leader>jt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
        vim.keymap.set("n", "<leader>jn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
        vim.keymap.set("v", "<leader>je", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
        vim.keymap.set("n", "<leader>je", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
        vim.keymap.set("v", "<leader>jm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
        require("jdtls").start_or_attach(config)
    end,
}

-- Newly added dependencies are not found
--
-- You can try running :JdtUpdateConfig to refresh the configuration. If that doesn't work you'll need to restart the language server.
-- Language server doesn't find classes that should be there
--
-- The language server supports gradle and maven as build tools. Your project should either have a pom.xml or settings.gradle and build.gradle file to declare the dependencies.
--
-- As an alternative you could manually specify the dependencies within your nvim-jdtls configuration like the following, but this is not recommended.
--
-- config.settings = {
--     java = {
--       project = {
--         referencedLibraries = {
--           '/path/to/dependencyA.jar',
--           '/path/to/dependencyB.jar',
--         },
--       }
--     }
--   }
--
-- If you modify files outside of Neovim (for example with a git checkout), the language client and language server may not detect these changes and the state of the file on disk diverges with the mental model of the language server. If that happens, you need to open all changed files within Neovim and reload them with :e! to synchronize the state.
