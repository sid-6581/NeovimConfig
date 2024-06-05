return {
  "epwalsh/obsidian.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>O", "<CMD>cd ~/vaults/Notes | Neotree<CR>", desc = "Obsidian" },
  },

  opts = {
    workspaces = {
      {
        name = "Notes",
        path = "~/vaults/Notes",
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
    disable_frontmatter = true,
    new_notes_location = "current_dir",
    notes_subdir = nil,
  },

  config = function(_, opts)
    if vim.fn.isdirectory(vim.fn.expand(opts.workspaces[1].path)) == 0 then table.remove(opts.workspaces, 1) end

    require("obsidian").setup(opts)

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "markdown" },
      callback = function()
        vim.opt_local.conceallevel = 2
        vim.opt_local.concealcursor = { n = true, c = true }
      end,
    })
  end,
}
