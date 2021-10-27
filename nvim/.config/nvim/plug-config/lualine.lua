require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox'
  },
  sections = {                                                                                                 
    lualine_z = { function() return vim.api.nvim_exec([[echo "| W: " . WindowNumber() . " |"]], true) end }  
  },                                                                                                           
  inactive_sections = {                                                                                        
    lualine_z = { function() return vim.api.nvim_exec([[echo "| W: " . WindowNumber() . " |"]], true) end }  
  }  
}
