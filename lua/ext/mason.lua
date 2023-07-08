require("helpers.globals")

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
    local lsp_table = require("clangd_extensions").prepare({
      server = {},
      extensions = {
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,
        -- These apply to the default ClangdSetInlayHints command
        inlay_hints = {
          inline = fn.has("nvim-0.10") == 1,
          -- Options other than `highlight' and `priority' only work
          -- if `inline' is disabled
          -- Only show inlay hints for the current line
          only_current_line = false,
          -- Event which triggers a refersh of the inlay hints.
          -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
          -- not that this may cause  higher CPU usage.
          -- This option is only respected when only_current_line and
          -- autoSetHints both are true.
          only_current_line_autocmd = "CursorHold",
          -- whether to show parameter hints with the inlay hints or not
          show_parameter_hints = true,
          -- prefix for parameter hints
          parameter_hints_prefix = "<- ",
          -- prefix for all the other hints (type, chaining)
          other_hints_prefix = "=> ",
          -- whether to align to the length of the longest line in the file
          max_len_align = false,
          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,
          -- whether to align to the extreme right or not
          right_align = false,
          -- padding from the right if right_align is true
          right_align_padding = 7,
          -- The color of the hints
          highlight = "Comment",
          -- The highlight group priority for extmark
          priority = 100,
        },
        ast = {
          -- These are unicode, should be available in any font
          role_icons = {
               type = "🄣",
               declaration = "🄓",
               expression = "🄔",
               statement = ";",
               specifier = "🄢",
               ["template argument"] = "🆃",
          },
          kind_icons = {
              Compound = "🄲",
              Recovery = "🅁",
              TranslationUnit = "🅄",
              PackExpansion = "🄿",
              TemplateTypeParm = "🅃",
              TemplateTemplateParm = "🅃",
              TemplateParamObject = "🅃",
          },
          --[[ These require codicons (https://github.com/microsoft/vscode-codicons)
          role_icons = {
              type = "",
              declaration = "",
              expression = "",
              specifier = "",
              statement = "",
              ["template argument"] = "",
          },

          kind_icons = {
              Compound = "",
              Recovery = "",
              TranslationUnit = "",
              PackExpansion = "",
              TemplateTypeParm = "",
              TemplateTemplateParm = "",
              TemplateParamObject = "",
          }, ]]
          highlights = {
              detail = "Comment",
          },
        },
        memory_usage = {
          border = "none",
        },
        symbol_info = {
          border = "none",
        },
      },
    })
    lspconfig["clangd"].setup(lsp_table);
    -- lspconfig["clangd"].setup({});
  end,
}

