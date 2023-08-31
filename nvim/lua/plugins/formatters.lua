return {
  {
    "mhartington/formatter.nvim",
    keys = {
      { "<leader>fd", ":Format<cr>" },
    },
    config = function()
      local prettierconfig = require("formatter.defaults.prettier")

      require("formatter").setup({
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },

          html={prettierconfig},
          json={prettierconfig},
          yaml={prettierconfig},
          graphql={prettierconfig},
          markdown={prettierconfig},
          javascript={prettierconfig},
          javascriptreact={prettierconfig},
          typescript={prettierconfig},
          typescriptreact={prettierconfig},

          rust={require("formatter.filetypes.rust")}

          toml={require("formatter.filetypes.toml")},

          cs={require("formatter.filetypes.cs").dotnetformat},

          c={require("formatter.filetypes.c").clangformat},

          terraform={require("formatter.filetypes.terraform")},

          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })
    end,
  },
}
