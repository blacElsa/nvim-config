vim.o.timeout = true
vim.o.timeoutlen = 300
require("which-key").setup({
  key_labels = {

    -- override the label used to display some keys. It doesn't effect WK in any other way.

    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
})
