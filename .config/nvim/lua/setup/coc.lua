local M = {}


M.config = function ()
  -- Extensions installed
  -- vim.g.coc_global_extensions = {
  --   'coc-marketplace',  -- Extensions market
  --   'coc-clangd',
  --   'coc-sh',
  --   'coc-lua',
  --   'coc-pyright',
  --   'coc-tsserver',
  --   'coc-phpls',
  --   'coc-prettier',
  --   'coc-snippets',
  --   'coc-pairs',  -- Auto pair
  -- }

  -- Use Tab for trigger completion with characters ahead and navigate
  -- NOTE: There's always a completion item selected by default, you may want to enable
  -- no select by setting `"suggest.noselect": true` in your configuration file
  -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
  -- other plugins before putting this into your config
  local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
  vim.keymap.set('i', '<TAB>', "coc#pum#visible() ? coc#pum#next(1) : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<TAB>\" : coc#refresh()", opts)
  vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

  -- Make <CR> to accept selected completion item or notify coc.nvim to format
  -- <C-g>u breaks current undo, please make your own choice
  vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

  -- Remap <C-f> and <C-b> to scroll float windows/popups
  ---@diagnostic disable-next-line: redefined-local
  local opts = {silent = true, nowait = true, expr = true}
  vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
  vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
  vim.keymap.set("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
  vim.keymap.set("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
  vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
  vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

  -- Prettier command
  vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument')
  -- Formatting selected code
  vim.keymap.set('v', '<leader>f', '<Plug>(coc-format-selected)')

  -- GoTo code navigation
  vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
  vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
  vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
  vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

  -- Symbol renaming
  vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

  -- Find symbol of current document
  vim.keymap.set("n", "<leader>o", ":CocList outline<cr>", {silent = true, nowait = true})
end


return M
