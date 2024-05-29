return {
  "epwalsh/obsidian.nvim",
  event = "VeryLazy",

  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        -- Use obsidian for any markdown file
        name = "no-vault",
        path = function() return vim.fs.dirname(vim.api.nvim_buf_get_name(0)) end,
        overrides = {
          notes_subdir = vim.NIL,
          new_notes_location = "current_dir",
          templates = {
            folder = vim.NIL,
          },
          disable_frontmatter = true,
        },
      },
    },
  },

  config = function(_, opts)
    if vim.fn.isdirectory(vim.fn.expand(opts.workspaces[1].path)) == 0 then table.remove(opts.workspaces, 1) end

    require("obsidian").setup(opts)

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "markdown" },
      callback = function() vim.opt_local.conceallevel = 1 end,
    })
  end,
}
