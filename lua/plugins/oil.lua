return {
  "stevearc/oil.nvim",
  opts = {},

  config = function(_, opts)
    require("oil").setup(opts)

    vim.api.nvim_create_autocmd("TextChanged", {
      desc = "Set cwd to follow directory shown in oil buffers",
      group = vim.api.nvim_create_augroup("OilAutoCwd", {}),
      pattern = "oil:///*",
      callback = function()
        if vim.bo.filetype == "oil" then vim.cmd.lcd(require("oil").get_current_dir()) end
      end,
    })
  end,
}
