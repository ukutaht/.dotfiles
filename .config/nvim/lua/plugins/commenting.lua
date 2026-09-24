return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")

    comment.setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        line = "<leader>/",
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },
      mappings = {
        basic = true,
        extra = true,
      },
    })

    -- Custom keymap for visual mode
    vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {
      desc = "Toggle comment (visual mode)"
    })
  end,
}