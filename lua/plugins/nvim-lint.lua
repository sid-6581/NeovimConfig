return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",

  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      dockerfile = { "hadolint" },
      yaml = { "yamllint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function() require("lint").try_lint() end,
    })
  end,
}
