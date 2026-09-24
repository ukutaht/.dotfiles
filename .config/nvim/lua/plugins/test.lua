return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "jfpedroza/neotest-elixir",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-elixir")({
            extra_formatters = {},
            args = {},
          }),
        }
      })

      vim.keymap.set("n", "<leader>tn", function()
        require("neotest").run.run()
      end, { desc = "Run nearest test" })

      vim.keymap.set("n", "<leader>tf", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "Run current file tests" })

      vim.keymap.set("n", "<leader>ts", function()
        require("neotest").run.run(vim.fn.getcwd())
      end, { desc = "Run test suite" })

      vim.keymap.set("n", "<leader>tl", function()
        require("neotest").run.run_last()
      end, { desc = "Run last test" })

      vim.keymap.set("n", "<leader>to", function()
        require("neotest").output.open({ enter = true })
      end, { desc = "Open test output" })

      vim.keymap.set("n", "<leader>tp", function()
        require("neotest").output_panel.toggle()
      end, { desc = "Toggle test output panel" })

      vim.keymap.set("n", "<leader>tt", function()
        require("neotest").summary.toggle()
      end, { desc = "Toggle test summary" })
    end,
  },
}
