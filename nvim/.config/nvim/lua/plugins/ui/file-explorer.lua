return {
  "nvim-tree/nvim-tree.lua",
  event = "BufWinEnter",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      view = {
        side = "left",
        signcolumn = "yes",   -- Show git signs in the sign column
        width = {
          min = 30,           -- Ensure a minimum width for better readability
        },
        adaptive_size = true, -- Adjust width based on content size
        -- float = {
        -- 	enable = true,
        -- 	open_win_config = {
        -- 		relative = "editor",
        -- 		width = 40, -- Width of the floating window
        -- 		height = 30, -- Increased height for better visibility
        -- 		row = 1,
        -- 		col = 1,
        -- 		border = "single",
        -- 	},
        -- },
      },
      renderer = {
        hidden_display = "all",
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,

            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_closed = "", -- Arrow when folder is closed
              arrow_open = "", -- Arrow when folder is open
              default = "", -- Default folder icon
              open = "", -- Open folder icon
              empty = "", -- Empty folder icon
              empty_open = "", -- Empty open folder icon
              symlink = "", -- Symlink folder icon
            },
            git = {
              unstaged = "✗", -- Unstaged changes
              staged = "✓", -- Staged changes
              unmerged = "", -- Unmerged changes
              renamed = "➜", -- Renamed files
              deleted = "", -- Deleted files
              ignored = "◌", -- Ignored files
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false, -- Disable window picker for simpler navigation
          },
        },
      },
      filters = {
        dotfiles = true,                                            -- Show dotfiles
        custom = { ".DS_Store", ".git", "node_modules", ".cache" }, -- Filter these files
      },
      git = {
        enable = true,  -- Enable git integration
        ignore = false, -- Show ignored files
        timeout = 400,  -- Adjust timeout for git operations
      },
      trash = {
        cmd = "trash",          -- Use trash command for file deletion
        require_confirm = true, -- Confirm before deleting files
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    })

    -- Key mappings for nvim-tree
    local keymap = vim.keymap -- For conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set(
      "n",
      "<leader>ef",
      "<cmd>NvimTreeFindFileToggle<CR>",
      { desc = "Toggle file explorer on current file" }
    )
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}
