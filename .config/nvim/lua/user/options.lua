local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h11",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Random small config


-- some global vars
-- vim.g.vscode_italic_comment = 1 -- sets vscode theme comments as italic
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd [[set noemoji]]

-- presence.nvim config
require("presence"):setup({
  main_image = "file",
  workspace_text = "Working on %s",
  buttons = true,
  neovim_image_text = "vi > vscode (vscode users trying to use less than 2 gigs of ram)"
})

-- colorizer config
require("colorizer").setup({ "*" }, {
       RGB = true, -- #RGB hex codes
       RRGGBB = true, -- #RRGGBB hex codes
       RRGGBBAA = true, -- #RRGGBBAA hex codes
       rgb_fn = true, -- CSS rgb() and rgba() functions
       hsl_fn = true, -- CSS hsl() and hsla() functions
       css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
       css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
     })

---- trouble.nvim config
require("trouble").setup {
     position = "bottom", -- position of the list can be: bottom, top, left, right
   height = 10, -- height of the trouble list when position is top or bottom
   width = 50, -- width of the list when position is left or right
   icons = true, -- use devicons for filenames
   mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
   fold_open = "", -- icon used for open folds
   fold_closed = "", -- icon used for closed folds
   group = true, -- group results by file
   padding = true, -- add an extra new line on top of the list
   action_keys = { -- key mappings for actions in the trouble list
       -- map to {} to remove a mapping, for example:
       -- close = {},
       close = "q", -- close the list
       cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
       refresh = "r", -- manually refresh
       jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
       -- open_split = { "<c-x>" }, -- open buffer in new split
       -- open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
       -- open_tab = { "<c-t>" }, -- open buffer in new tab
       jump_close = {"o"}, -- jump to the diagnostic and close the list
       toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
       toggle_preview = "P", -- toggle auto_preview
       hover = "K", -- opens a small popup with the full multiline message
       preview = "p", -- preview the diagnostic location
       close_folds = {"zM", "zm"}, -- close all folds
       open_folds = {"zR", "zr"}, -- open all folds
       toggle_fold = {"zA", "za"}, -- toggle fold of current file
       previous = "k", -- preview item
       next = "j" -- next item
   },
   indent_lines = true, -- add an indent guide below the fold icons
   auto_open = false, -- automatically open the list when you have diagnostics
   auto_close = true, -- automatically close the list when you have no diagnostics
   auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
   auto_fold = false, -- automatically fold a file trouble list at creation
   auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
   signs = {
       -- icons / text used for a diagnostic
       error = "",
       warning = "",
       hint = "",
       information = "",
       other = ""
   },
   use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}

