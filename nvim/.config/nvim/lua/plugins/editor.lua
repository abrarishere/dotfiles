return {
  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    opts = {},
  },
  {
    "telescope.nvim",
    priority = 1000,
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({
            no_ignore = false,
            hidden = false,
          })
        end,
        desc = "Fuzzy find files in cwd",
      },

      {
        "<leader>fr",
        function()
          require("telescope.builtin").oldfiles({
            only_cwd = true,
          })
        end,
        desc = "Fuzzy find recent files",
      },
      {
        "<leader>fs",
        function()
          require("telescope.builtin").live_grep({
            additional_args = function()
              return { "--hidden" }
            end,
          })
        end,
        desc = "Find string in cwd",
      },

      {
        "<leader>fc",
        function()
          require("telescope.builtin").grep_string({
            search = vim.fn.expand("<cword>"),
          })
        end,
        desc = "Find string under cursor in cwd",
      },

      {
        "<leader>fT",
        function()
          require("telescope.builtin").builtin()
        end,
        desc = "Open Telescope menu",
      },

      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Find help tags",
      },

      {
        "<leader>fg",
        function()
          require("telescope.builtin").git_commits()
        end,
        desc = "Find git commits",
      },

      {
        "<leader>fb",
        function()
          require("telescope.builtin").git_branches()
        end,
        desc = "Find git branches",
      },

      {
        "<leader>fd",
        function()
          require("telescope.builtin").git_status()
        end,
        desc = "Find git status",
      },
    },
  },
}
