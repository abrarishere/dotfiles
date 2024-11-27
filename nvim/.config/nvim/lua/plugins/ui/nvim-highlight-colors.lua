return{
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",
config = function()
  local c = require("nvim-highlight-colors")
  c.setup({
      render= 'virtual',
    })
  end,
  
    vim.keymap.set('n', '<leader>wC', function()
    require('nvim-highlight-colors').toggle()
    end,  { desc = "Toggle highlight colors" })
}
