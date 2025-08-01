return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",

  config = function()
    require("lint").linters_by_ft = {
      dockerfile = { "hadolint" },
      sql = { "sqlfluff" },
      yaml = { "yamllint" },
    }

    local timer = vim.uv.new_timer()

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave", "TextChanged" }, {
      callback = function()
        if timer then
          timer:stop()
          timer:start(500, 0, function()
            timer:stop()
            vim.schedule(require("lint").try_lint)
          end)
        end
      end,
    })
  end,
}
