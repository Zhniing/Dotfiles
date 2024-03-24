return {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  ft = "markdown",
  keys = {
    { "<leader>p", ":MarkdownPreviewToggle <CR>", ft = "markdown" },
  },
}
