local DISABLED_FILETYPES = {
    "checkhealth",
    "fugitive",
    "git",
    "gitcommit",
    "help",
    "lspinfo",
    "man",
    "oil",
    "qf",
    "query",
    "scratch",
    "startuptime",
}

local DISABLED_BUFTYPES = {
    "nofile",
    "nowrite",
    "prompt",
}

return {
    "saghen/blink.cmp",

    opts = {
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 100,
                window = {
                    border = "single",
                    max_height = 20,
                    max_width = 50,
                },
            },
            list = {
                selection = {
                    auto_insert = true,
                },
            },
            menu = {
                auto_show = true,
                border = "single",
                draw = {
                    columns = {
                        { "label" },
                        { "kind" },
                    },
                    treesitter = { "lsp" },
                },
            },
            trigger = {
                show_on_blocked_trigger_characters = {
                    " ",
                    "\n",
                    "\t",
                    "(",
                    ")",
                    "{",
                    "}",
                    "[",
                    "]",
                    ",",
                    ":",
                    ";",
                    "=",
                    "+",
                    "-",
                    "*",
                    "/",
                    "%",
                    "&",
                    "|",
                    "^",
                    "~",
                },
            },
        },
        enabled = function()
            return not (
                vim.tbl_contains(DISABLED_BUFTYPES, vim.bo.buftype)
                or vim.tbl_contains(DISABLED_FILETYPES, vim.bo.filetype)
            )
        end,
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            sorts = { "exact", "score", "sort_text" },
        },
        keymap = require("config.keymaps").setup_blink_keymaps(),

        signature = {
            enabled = true,
            window = {
                border = "single",
                max_height = 20,
                max_width = 50,
            },
        },
        sources = {
            default = { "lazydev", "lsp", "path", "buffer", "snippets" },
            per_filetype = {
                sql = { "dadbod" },
            },
            providers = {
                dadbod = { module = "vim_dadbod_completion.blink" },
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            }
        },
    },

    event = { "InsertEnter", "CmdlineEnter" },
    version = "1.*",
}
