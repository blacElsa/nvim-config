local lspkind = require('lspkind')

lspkind.init({
  mode = 'symbol',
  preset = 'codicons',
  symbol_map = {
    Text = "",
    Method = "",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Referece = "&",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
  },
})
