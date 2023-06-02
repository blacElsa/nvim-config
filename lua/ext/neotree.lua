local neotree = require("neo-tree")

neotree.setup({
  close_if_last_window = true,
  name = {
    trailing_slash = true,
    use_git_status_colors = true,
    highlight = "NeoTreeFileName",
  },
  window = {
    width = 50,
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        ".git"
      },
    },
    follow_current_file = false,
  },
  icon = {
    folder_closed = "",
    folder_open = "",
    folder_empty = "",
    default = "*",
    highlight = "NeoTreeFileIcon"
  }
})
