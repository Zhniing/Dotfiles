-- Line number
vim.o.number = true
vim.o.relativenumber = true

-- Indent
vim.o.tabstop = 4  -- tab character
vim.o.shiftwidth = 0  -- indent, 0 means following 'tabstop'
vim.o.expandtab = true

-- Misc
vim.o.cursorline = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Wrap
vim.o.wrap = true

-- Color
vim.o.termguicolors = true
vim.cmd('colorscheme tokyonight-moon')

-- Intro message
vim.o.shortmess='I'

