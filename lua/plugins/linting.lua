return {
    "mfussenegger/nvim-lint",
    ft = {
        "markdown",
        "gitcommit",
        "c",
        "cpp",
        "php",
        "blade",
        "dockerfile",
        "bash",
        "html",
        "zsh",
        "json",
        "javascriptreact",
        "javascript",
        "typescript",
    },
    config = function()
        -- FOR semgrep
        -- require("lint").linters.your_linter_name = {
        --     cmd = "linter_cmd",
        --     stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
        --     append_fname = true, -- Automatically append the file name to `args` if `stdin = false` (default: true)
        --     args = {}, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
        --     stream = nil, -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
        --     ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
        --     env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
        --     parser = your_parse_function,
        -- }
        --

        require("lint").linters_by_ft = {
            java = { "checkstyle", "trivy" },
            markdown = { "vale" },
            c = { "cpplint", "cppcheck" },
            cpp = { "cpplint", "cppcheck" },
            blade = { "tlint" },
            dockerfile = { "hadolint" },
            python = { "ruff" },
            html = { "htmlhint" },
            zsh = { "zsh" },
            json = { "eslint_d" },
            javascript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescript = { "eslint_d" },
            gitcommit = { "commitlint" },
        }

        vim.api.nvim_create_autocmd("BufWritePost", {
            desc = "Try linting the written file",
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}

-- | Tool                                   | Linter name            |
-- | -------------------------------------- | ---------------------- |
-- | Set via `makeprg`                      | `compiler`             |
-- | [actionlint][actionlint]               | `actionlint`           |
-- | [alex][alex]                           | `alex`                 |
-- | [ameba][ameba]                         | `ameba`                |
-- | [ansible-lint][ansible-lint]           | `ansible_lint`         |
-- | [bandit][bandit]                       | `bandit`               |
-- | [bash][bash]                           | `bash`                 |
-- | [bean-check][bean-check]               | `bean_check`           |
-- | [biomejs][biomejs]                     | `biomejs`              |
-- | [blocklint][blocklint]                 | `blocklint`            |
-- | [buf_lint][buf_lint]                   | `buf_lint`             |
-- | [buildifier][buildifier]               | `buildifier`           |
-- | [cfn-lint][cfn-lint]                   | `cfn_lint`             |
-- | [cfn_nag][cfn_nag]                     | `cfn_nag`              |
-- | [checkmake][checkmake]                 | `checkmake`            |
-- | [checkpatch.pl][checkpatch]            | `checkpatch`           |
-- | [checkstyle][checkstyle]               | `checkstyle`           |
-- | [chktex][20]                           | `chktex`               |
-- | [clang-tidy][23]                       | `clangtidy`            |
-- | [clazy][30]                            | `clazy`                |
-- | [clippy][clippy]                       | `clippy`               |
-- | [clj-kondo][24]                        | `clj-kondo`            |
-- | [cmakelint][cmakelint]                 | `cmakelint`            |
-- | [codespell][18]                        | `codespell`            |
-- | [commitlint][commitlint]               | `commitlint`           |
-- | [cppcheck][22]                         | `cppcheck`             |
-- | [cpplint][cpplint]                     | `cpplint`              |
-- | [credo][credo]                         | `credo`                |
-- | [cspell][36]                           | `cspell`               |
-- | [cue][cue]                             | `cue`                  |
-- | [curlylint][curlylint]                 | `curlylint`            |
-- | [dash][dash]                           | `dash`                 |
-- | [deadnix][deadnix]                     | `deadnix`              |
-- | [deno][deno]                           | `deno`                 |
-- | [dmypy][dmypy]                         | `dmypy`                |
-- | [DirectX Shader Compiler][dxc]         | `dxc`                  |
-- | [djlint][djlint]                       | `djlint`               |
-- | [dotenv-linter][dotenv-linter]         | `dotenv_linter`        |
-- | [editorconfig-checker][ec]             | `editorconfig-checker` |
-- | [erb-lint][erb-lint]                   | `erb_lint`             |
-- | [ESLint][25]                           | `eslint`               |
-- | [eslint_d][37]                         | `eslint_d`             |
-- | [eugene][eugene]                       | `eugene`               |
-- | [fennel][fennel]                       | `fennel`               |
-- | [fish][fish]                           | `fish`                 |
-- | [Flake8][13]                           | `flake8`               |
-- | [flawfinder][35]                       | `flawfinder`           |
-- | [gawk][gawk]                           | `gawk`                 |
-- | [gdlint (gdtoolkit)][gdlint]           | `gdlint`               |
-- | [GHDL][ghdl]                           | `ghdl`                 |
-- | [gitlint][gitlint]                     | `gitlint`              |
-- | [glslc][glslc]                         | `glslc`                |
-- | [Golangci-lint][16]                    | `golangcilint`         |
-- | [hadolint][28]                         | `hadolint`             |
-- | [hledger][hledger]                     | `hledger`              |
-- | [hlint][32]                            | `hlint`                |
-- | [htmlhint][htmlhint]                   | `htmlhint`             |
-- | [HTML Tidy][12]                        | `tidy`                 |
-- | [Inko][17]                             | `inko`                 |
-- | [janet][janet]                         | `janet`                |
-- | [joker][joker]                         | `joker`                |
-- | [jshint][jshint]                       | `jshint`               |
-- | [jsonlint][jsonlint]                   | `jsonlint`             |
-- | [ksh][ksh]                             | `ksh`                  |
-- | [ktlint][ktlint]                       | `ktlint`               |
-- | [lacheck][lacheck]                     | `lacheck`              |
-- | [Languagetool][5]                      | `languagetool`         |
-- | [luac][luac]                           | `luac`                 |
-- | [luacheck][19]                         | `luacheck`             |
-- | [markdownlint][26]                     | `markdownlint`         |
-- | [markdownlint-cli2][markdownlint-cli2] | `markdownlint-cli2`    |
-- | [markuplint][markuplint]               | `markuplint`           |
-- | [mlint][34]                            | `mlint`                |
-- | [Mypy][11]                             | `mypy`                 |
-- | [Nagelfar][nagelfar]                   | `nagelfar`             |
-- | [Nix][nix]                             | `nix`                  |
-- | [npm-groovy-lint][npm-groovy-lint]     | `npm-groovy-lint`      |
-- | [oelint-adv][oelint-adv]               | `oelint-adv`           |
-- | [opa_check][opa_check]                 | `opa_check`            |
-- | [oxlint][oxlint]                       | `oxlint`               |
-- | [perlcritic][perlcritic]               | `perlcritic`           |
-- | [perlimports][perlimports]             | `perlimports`          |
-- | [phpcs][phpcs]                         | `phpcs`                |
-- | [phpinsights][phpinsights]             | `phpinsights`          |
-- | [phpmd][phpmd]                         | `phpmd`                |
-- | [php][php]                             | `php`                  |
-- | [phpstan][phpstan]                     | `phpstan`              |
-- | [ponyc][ponyc]                         | `pony`                 |
-- | [prisma-lint][prisma-lint]             | `prisma-lint`          |
-- | [proselint][proselint]                 | `proselint`            |
-- | [protolint][protolint]                 | `protolint`            |
-- | [psalm][psalm]                         | `psalm`                |
-- | [puppet-lint][puppet-lint]             | `puppet-lint`          |
-- | [pycodestyle][pcs-docs]                | `pycodestyle`          |
-- | [pydocstyle][pydocstyle]               | `pydocstyle`           |
-- | [Pylint][15]                           | `pylint`               |
-- | [pyproject-flake8][pflake8]            | `pflake8`              |
-- | [quick-lint-js][quick-lint-js]         | `quick-lint-js`        |
-- | [regal][regal]                         | `regal`                |
-- | [Revive][14]                           | `revive`               |
-- | [rflint][rflint]                       | `rflint`               |
-- | [robocop][robocop]                     | `robocop`              |
-- | [rpmlint][rpmlint]                     | `rpmlint`              |
-- | [RPM][rpm]                             | `rpmspec`              |
-- | [rstcheck][rstcheck]                   | `rstcheck`             |
-- | [rstlint][rstlint]                     | `rstlint`              |
-- | [RuboCop][rubocop]                     | `rubocop`              |
-- | [Ruby][ruby]                           | `ruby`                 |
-- | [Ruff][ruff]                           | `ruff`                 |
-- | [salt-lint][salt-lint]                 | `saltlint`             |
-- | [Selene][31]                           | `selene`               |
-- | [ShellCheck][10]                       | `shellcheck`           |
-- | [slang][slang]                         | `slang`                |
-- | [Snakemake][snakemake]                 | `snakemake`            |
-- | [snyk][snyk]                           | `snyk_iac`             |
-- | [Solhint][solhint]                     | `solhint`              |
-- | [Spectral][spectral]                   | `spectral`             |
-- | [sphinx-lint][sphinx-lint]             | `sphinx-lint`          |
-- | [sqlfluff][sqlfluff]                   | `sqlfluff`             |
-- | [sqruff][sqruff]                       | `sqruff`               |
-- | [standardjs][standardjs]               | `standardjs`           |
-- | [StandardRB][27]                       | `standardrb`           |
-- | [statix check][33]                     | `statix`               |
-- | [stylelint][29]                        | `stylelint`            |
-- | [svlint][svlint]                       | `svlint`               |
-- | [SwiftLint][swiftlint]                 | `swiftlint`            |
-- | [systemd-analyze][systemd-analyze]     | `systemd-analyze`      |
-- | [systemdlint][systemdlint]             | `systemdlint`          |
-- | [tflint][tflint]                       | `tflint`               |
-- | [tfsec][tfsec]                         | `tfsec`                |
-- | [tlint][tlint]                         | `tlint`                |
-- | [trivy][trivy]                         | `trivy`                |
-- | [ts-standard][ts-standard]             | `ts-standard`          |
-- | [typos][typos]                         | `typos`                |
-- | [Vala][vala-lint]                      | `vala_lint`            |
-- | [Vale][8]                              | `vale`                 |
-- | [Verilator][verilator]                 | `verilator`            |
-- | [vint][21]                             | `vint`                 |
-- | [VSG][vsg]                             | `vsg`                  |
-- | [vulture][vulture]                     | `vulture`              |
-- | [woke][woke]                           | `woke`                 |
-- | [write-good][write-good]               | `write_good`           |
-- | [yamllint][yamllint]                   | `yamllint`             |
-- | [yq][yq]                               | `yq`                   |
-- | [zizmor][zizmor]                       | `zizmor`               |
-- | [zsh][zsh]                             | `zsh`                  |
--
