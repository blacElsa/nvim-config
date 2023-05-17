require "helpers/globals"
require "helpers/keyboard"

local wk = require("which-key")
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
}

-- LSP
wk.register({
  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", group_names.lsp .. ": Hover" },
  g = {
    name = group_names.go,
    d = { "<cmd>Telescope lsp_definitions<CR>", group_names.lsp .. " Go to definition" },
    r = { "<cmd>Telescope lsp_references<CR>", group_names.lsp .. " Go to References" },
  },
  ["<leader>"] = {
    l = {
      name = group_names.lsp,
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", group_names.lsp .. ": Code action" },
      R = { "<cmd>lua vim.lsp.buf.rename()<CR>", group_names.lsp .. ": Rename" },
      s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", group_names.lsp .. "/Telescope: Symbols" },
    },
  },
})

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
      f = {"<cmd>Telescope find_files<CR>", group_names.telescope .. ": All Actions"},
    }
  }
})

wk.register({
  ["<leader>v"] = { "<cmd>NeoTreeFocusToggle<CR>", group_names.neotree }
})
