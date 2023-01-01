local M = {
  "kevinhwang91/nvim-bqf",
  ft = "qf",

  dependencies = {
    {
      "junegunn/fzf",
      build = ":call fzf#install()",
    },
  },
}

return M
