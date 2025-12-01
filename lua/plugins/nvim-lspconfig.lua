return {
    "neovim/nvim-lspconfig",
    config = function()
      -- Lua language server setup
		--[[
	  vim.lsp.config("lua_ls") {
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
      vim.lsp.config("pyright") {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
            },
          },
        },
      }
	]]--

      -- You can add other language servers setups here...
    end
}
