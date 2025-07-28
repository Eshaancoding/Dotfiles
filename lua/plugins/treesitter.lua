return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "windwp/nvim-ts-autotag" },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "json", "javascript", "typescript", "lua", "html", "css", "markdown", "python"
      }
    })
  end,
}

