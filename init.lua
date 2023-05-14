require "helpers/globals"

g.mapleader = ','

require "lazy_bootstrap"

local lazy = require("lazy")
lazy.setup("plugins")

require "settings"
require "keybindings"
