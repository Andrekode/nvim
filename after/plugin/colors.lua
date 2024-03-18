-- require('solarized-osaka').setup({
--     disable_background = true,
--     styles = {
--         -- Background styles. Can be "dark", "transparent" or "normal"
--         sidebars = "transparent", -- style for sidebars, see below
--         floats = "transparent", -- style for floating windows
--       },
--     day_brightnes = 1,
-- })
--
require('rose-pine').setup({
    disable_background = true,
    styles = {
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
})

require("gruvbox").setup({
    contrast = 'hard'
  -- terminal_colors = true, -- add neovim terminal colors
  -- undercurl = true,
  -- underline = true,
  -- bold = true,
  -- italic = {
  --   strings = true,
  --   emphasis = true,
  --   comments = true,
  --   operators = false,
  --   folds = true,
  -- },
  -- strikethrough = true,
  -- invert_selection = false,
  -- invert_signs = false,
  -- invert_tabline = false,
  -- invert_intend_guides = false,
  -- inverse = true, -- invert background for search, diffs, statuslines and errors
  -- contrast = "", -- can be "hard", "soft" or empty string
  -- palette_overrides = {},
  -- overrides = {},
  -- dim_inactive = false,
  -- transparent_mode = false,
})

function ColorMyPencils(color) 
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils('gruvbox')
