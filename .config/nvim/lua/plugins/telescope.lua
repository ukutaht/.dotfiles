return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        file_ignore_patterns = {
          "%.git/",
          "node_modules/",
          "%.npm/",
          "%.venv/",
          "__pycache__/",
          "%.pyc",
          "%.o",
          "%.a",
          "%.out",
          "%.class",
          "%.pdf",
          "%.mkv",
          "%.mp4",
          "%.zip"
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-x>"] = actions.delete_buffer,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
          hidden = true,
        },
        live_grep = {
          file_ignore_patterns = { "node_modules", ".git", ".venv" },
          additional_args = function(_)
            return { "--hidden" }
          end,
        },
        buffers = {
          previewer = false,
          initial_mode = "normal",
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap.set

    keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd", nowait = true })

    -- Normal mode: no prefill
    keymap("n", "<leader>g", function()
      require("telescope.builtin").live_grep()
    end, { desc = "Find string in cwd" })

    -- Visual mode: prefill with selection
    keymap("v", "<leader>g", function()
      local function get_visual_selection()
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg('v')
        vim.fn.setreg('v', {})
        text = string.gsub(text, "\n", "")
        if #text > 0 then
          return text
        else
          return ''
        end
      end

      local selected_text = get_visual_selection()
      require("telescope.builtin").live_grep({ default_text = selected_text })
    end, { desc = "Find string in cwd (with selection)" })
  end,
}