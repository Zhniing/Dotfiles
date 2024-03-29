-- Line number
vim.o.number = true

-- Relative line number
vim.o.relativenumber = true
-- Only use relative line numbers in visual mode (`\x16` is <C-v>)
-- vim.cmd("au ModeChanged [vV\x16]*:* let &l:rnu = mode() =~# '^[vV\x16]'")
-- vim.cmd("au ModeChanged *:[vV\x16]* let &l:rnu = mode() =~# '^[vV\x16]'")
-- vim.cmd("au WinEnter,WinLeave * let &l:rnu = mode() =~# '^[vV\x16]'")

-- The length of tab
vim.o.tabstop = 4
-- The length of indent (0 means following 'tabstop')
vim.o.shiftwidth = 0
-- Use white spaces instead of the tab for indent
vim.o.expandtab = true

-- Highlight the current line
vim.o.cursorline = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable wrap
vim.o.wrap = true

-- Color
vim.o.termguicolors = true

-- Inhibit the intro message
vim.o.shortmess = 'I'

-- Statusline
vim.o.laststatus = vim.g.started_by_firenvim and 0 or 3;

-- Firenvim
vim.g.firenvim_config = {
  globalSettings = { alt = "all" },
  localSettings = {
    [".*"] = {
      cmdline  = "neovim",
      content  = "text",
      priority = 0,
      selector = "textarea",
      takeover = "never"  -- Triggered manually
    }
  }
}

-- Always keep the sign column
vim.o.signcolumn = "yes"

-- Remove the tilde symbols
vim.opt.fillchars = { eob = " " }

-- To copy/paste with the system clipboard
vim.o.clipboard = "unnamedplus"

-- Inhibit auto comment in newline
vim.cmd("autocmd FileType * set formatoptions-=ro")

-- GUI configurations for Neovide
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono NF:h12"
  vim.g.neovide_transparency = 0.95
end
