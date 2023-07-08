require "helpers/globals"
require "helpers/keyboard"

local wk = require("which-key")
local dap = require("dap")
local dapui = require("dapui")

-- diasble arrow keys

nm('<up>', ':echoe "Use k"<CR>')
nm('<down>', ':echoe "Use j"<CR>')
nm('<left>', ':echoe "Use h"<CR>')
nm('<right>', ':echoe "Use l"<CR>')

nm('<F2>', ':nohl<CR>')
nm('<S-F1', ':g/^$/d<CR>')

local group_names = {
  telescope = "Telescope",
  neotree = "NeoTree",
  lsp = "LSP",
  go = "Go to",
  dap = "DAP",
}

-- LSP
wk.register({
  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", group_names.lsp .. ": Hover" },
  g = {
    name = group_names.go,
    d = { "<cmd>Telescope lsp_definitions<CR>", group_names.lsp .. " Go to definition" },
    r = { "<cmd>Telescope lsp_references<CR>", group_names.lsp .. " Go to references" },
  },
  ["<leader>"] = {
    l = {
      name = group_names.lsp,
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", group_names.lsp .. ": Code action" },
      R = { "<cmd>lua vim.lsp.buf.rename()<CR>", group_names.lsp .. ": Rename" },
      d = { "<cmd>lua vim.diagnostic.open_float()<CR>", group_names.lsp .. ": Show diagnostic" },
      s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", group_names.lsp .. "/Telescope: Symbols" },
      A = { "<cmd>ClangAST", group_names.lsp .. "/Clangd-extension show AST" },
      h = { "<cmd>ClangdTypeHierarchy", group_names.lsp .. "/Clangd-extension show type hierarchy" },
    },
  },
})

wk.register({
  ['<leader>'] = {
    l = {
      name = group_names.lsp,
      A = { "<Esc>:'<,'>ClangAST<CR>", group_names.lsp .. "/Clangd-extension show AST" },
    }
  }
}, { mode = "v" })

-- Telescope
wk.register({
  ['<leader>'] = {
    t = {
      name = group_names.telescope,
      p = {"<cmd>Telescope oldfiles<CR>", group_names.telescope .. ": Recent files"},
      o = {"<cmd>Telescope git_files<CR>", group_names.telescope .. ": Open Git File"},
      b = {"<cmd>Telescope git_branches<CR>", group_names.telescope .. ": Branches"},
      g = {"<cmd>Telescope live_grep<CR>", group_names.telescope .. ": Find"},
      q = {"<cmd>Telescope buffers<CR>", group_names.telescope .. ": Buffers"},
      a = {"<cmd>Telescope<CR>", group_names.telescope .. ": All Actions"},
      f = {"<cmd>Telescope find_files<CR>", group_names.telescope .. ": Find files"},
    }
  }
})

-- DAP
wk.register({
  ['<F5>'] = { function() dap.continue() end, group_names.dap .. ": Run/resume debug session" },
  ['<F10>'] = { function() dap.step_over() end, group_names.dap .. ": Step over" },
  ['<F11>'] = { function() dap.step_into() end, group_names.dap .. ": Step into" },
  ['<F12>'] = { function() dap.step_out() end, group_names.dap .. ": Step out" },
  ['<leader>'] = {
    d = {
      name = group_names.dap,
      b = { function() dap.toggle_breakpoint() end, group_names.dap .. ": Toggle breakpoint"},
      B = { function() dap.set_breakpoint() end, group_names.dap .. ": Set breakpoint"},
      p = { function() dap.set_breakpoint(nil, nil, fn.input('Log point message: ')) end, group_names.dap .. ": Set log point"},
      c = { function() dap.set_breakpoint(fn.input('Condition: '), nil, nil) end, group_names.dap .. ": Set condition breakpoint"},
      f = { function() dapui.float_element() end, group_names.dap  .. ": Show float" },
   }
  }
})

wk.register({
  ['<leader>'] = {
    d = {
      name = group_names.dap,
      f = { function() dapui.float_element() end, group_names.dap  .. ": Show float" },
    }
  }
}, { mode = "v" })

wk.register({
  ['<leader>v'] = { "<cmd>NeoTreeFocusToggle<CR>", group_names.neotree }
})
