return{
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
  keys = {
    -- stop Persistence => session won't be saved on exit
    {"<leader>qd", "<cmd>lua require('persistence').stop()<CR>", desc = "stop Persistence => session won't be saved on exit"},
    -- load the last session
    {"<leader>ql", "<cmd>lua require('persistence').load({ last = true })<CR>", desc = "load the last session"},
    -- select a session to load
    {"<leader>qS", "<cmd>lua require('persistence').select()<CR>", desc = "select a session to load"},
    -- load the session for the current directory
    {"<leader>qs", "<cmd>lua require('persistence').load()<CR>", desc = "load the session for the current directory"},
  },
}
