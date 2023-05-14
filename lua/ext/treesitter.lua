require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
--    "cpp", -- build failed
    "lua",
    "vim",
    "vimdoc",
    "json",
    "javascript",
    "cmake",
    "python",
  },
}
