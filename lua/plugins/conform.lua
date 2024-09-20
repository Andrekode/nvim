return {
    {
        'stevearc/conform.nvim',
        opts = {
            format_on_save = function(bufnr)
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end
        },
        formatters_by_ft = {
            lua = { "stylua" },
            svelte = { { "prettierd", "prettier" } },
            javascript = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            javascriptreact = { { "prettierd", "prettier" } },
            typescriptreact = { { "prettierd", "prettier" } },
            json = { { "prettierd", "prettier" } },
            graphql = { { "prettierd", "prettier" } },
            java = { "google-java-format" },
            kotlin = { "ktlint" },
            ruby = { "standardrb" },
            markdown = { { "prettierd", "prettier" } },
            erb = { "htmlbeautifier" },
            html = { "htmlbeautifier" },
            bash = { "beautysh" },
            proto = { "buf" },
            rust = { "rustfmt" },
            yaml = { "yamlfix" },
            toml = { "taplo" },
            css = { { "prettierd", "prettier" } },
            scss = { { "prettierd", "prettier" } },
            sh = { { "shellcheck" } },
        },
    }
}
