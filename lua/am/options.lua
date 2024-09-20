vim.g.loaded_matchparen = 1
vim.opt.termguicolors = true
vim.opt.winbar = '%=%m %f'
local opt = vim.opt
vim.o.completeopt = "menuone,noselect"
-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }
opt.wildignore = "/node_modules"
opt.wildignore = opt.wildignore + { "*node_modules", "**/node_modules/*" }

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

-- undotree stuff
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

opt.mouse = 'nv'
vim.opt.conceallevel = 1
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1         -- Height of the command bar
opt.incsearch = true      -- Makes search act like search in modern browsers
opt.showmatch = false     -- show matching brackets when text indicator is over them
opt.relativenumber = true -- Show line numbers
opt.number = true         -- But show the actual number for the line we're on
opt.ignorecase = true     -- Ignore case when searching...
opt.smartcase = true      -- ... unless there is a capital letter in the query
opt.hidden = true         -- I like having buffers stay around
opt.equalalways = false   -- I don't like my windows changing all the time
opt.splitright = true     -- Prefer windows splitting to the right
opt.splitbelow = true     -- Prefer windows splitting to the bottom
opt.updatetime = 1000     -- Make updates happen faster
opt.hlsearch = true       -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10        -- Make it so there are always ten lines below my cursor
-- Cursorline highlighting control
--  Only have it on in the active buffer
opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
    vim.api.nvim_create_autocmd(event, {
        group = group,
        pattern = pattern,
        callback = function()
            vim.opt_local.cursorline = value
        end,
    })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1

opt.belloff = "all" -- Just turn the dang bell off

opt.clipboard = "unnamedplus"

opt.inccommand = "split"
opt.formatoptions = opt.formatoptions
    - "a" -- Auto formatting is BAD.
    - "t" -- Don't auto format my code. I got linters for that.
    + "c" -- In general, I like it when comments respect textwidth
    + "q" -- Allow formatting comments w/ gq
    - "o" -- O and o, don't continue comments
    + "r" -- But do continue when pressing enter.
    + "n" -- Indent past the formatlistpat, not underneath it.
    + "j" -- Auto-remove comments if possible.
    - "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }

vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }
