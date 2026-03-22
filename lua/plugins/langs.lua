return {
  {                                                                                                                                                                                          
    "nvim-treesitter/nvim-treesitter",                                                                                                                                                       
    build = ":TSUpdate",                                                                                                                                                                     
    event = { "BufReadPre", "BufNewFile" },                                                                                                                                                  
    config = function()                                                                                                                                                                      
      require("nvim-treesitter").setup({                                                                                                                                             
        highlight = {                                                                                                                                                                        
          enable = true,
		  disable = { "vue", "pug" }
        },                                                                                                                                                                                   
        indent = {                                                                                                                                                                           
          enable = true,                                                                                                                                                                     
        },                                                                                                                                                                                   
      })                                                                                                                                                                                     
    end,                                                                                                                                                                                     
  },                                                                                                                                                                                         
	{"digitaltoad/vim-pug", ft = {"pug", "vue"} },
	{"posva/vim-vue", ft = { "vue" } },
}
