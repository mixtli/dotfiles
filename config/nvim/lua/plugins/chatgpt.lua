return {
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      local homeDir = os.getenv("HOME")
      require("chatgpt").setup({
      predefined_chat_gpt_prompts = "file://" .. homeDir .. "/.config/nvim/data/prompts.csv"
    })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
}
