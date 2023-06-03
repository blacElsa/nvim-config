local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_dap = require("mason-nvim-dap")
local lspconfig = require("lspconfig")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",             -- LSP for Lua language
    "pyright",            -- LSP for Python
    "clangd",             -- LSP for C/C++
    "cmake",              -- LSP for CMake
  }
})
mason_dap.setup({
  ensure_installed = {
    "codelldb"            -- DAP for C/C++
  },
  handlers = {
    function(config)
      mason_dap.default_setup(config)
    end,
  }
})

-- Setup every needed language server in lspconfig
mason_lspconfig.setup_handlers {
  function (server_name)
    lspconfig[server_name].setup {}
  end,
  ["clangd"] = function ()
    -- local lsp_table = require("clangd_extensions").prepare()
    -- lspconfig["clangd"].setup(lsp_table);
    lspconfig["clangd"].setup({});
  end,
}

