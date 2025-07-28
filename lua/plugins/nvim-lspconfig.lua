return {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Lua language server setup
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      }

      -- Pyright (Python) setup with type checking off
      lspconfig.pyright.setup {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
            },
          },
        },
      }

      -- You can add other language servers setups here...
    end
}
