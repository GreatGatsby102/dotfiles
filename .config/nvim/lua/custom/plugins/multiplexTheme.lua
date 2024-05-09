return {
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        style = 'multiplex',
        transparent = false,
        term_colors = false,
        ending_tildes = false,
        cmp_itemkind_reverse = false,

        code_style = {
          comments = { italic = true },
          conditionals = { italic = true },
          keywords = {},
          functions = {},
          namespaces = { italic = true },
          paramaters = { italic = true },
          strings = {},
          variables = {},
        },

        lualine = {
          transparent = false,
        },

        diagnostics = {
          darker = false,
          undercurl = true,
          background = true,
        },
      }
      require('bamboo').load()
    end,
  },
}
