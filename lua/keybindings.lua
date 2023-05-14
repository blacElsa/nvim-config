require "helpers/globals"
require "helpers/keyboard"

local wk = require("which-key")
-- diasble arrow keys

nm('<up>', ':echoe "Use k"<CR>')
nm('<down>', ':echoe "Use j"<CR>')
nm('<left>', ':echoe "Use h"<CR>')
nm('<right>', ':echoe "Use l"<CR>')

nm('<F1>', ':nohl<CR>')
nm('<S-F1', ':g/^$/d<CR>')

local group_names = {
  telescope = "Telescope",
  neotree = "NeoTree",
}

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
