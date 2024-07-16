return {
  "epwalsh/obsidian.nvim",
  event = { "VeryLazy", "BufEnter" },

  keys = {
    { "<Leader>O", "<CMD>cd ~/vaults/Notes | Neotree show<CR>", desc = "Open [obsidian]" },
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
        path = function()
          return vim.fs.dirname(vim.api.nvim_buf_get_name(0))
        end,
        overrides = {
          notes_subdir = vim.NIL,
          new_notes_location = "current_dir",
          daily_notes = {
            folder = vim.NIL,
          },
          templates = {
            folder = vim.NIL,
          },
          disable_frontmatter = true,
        },
      },
    },
    ui = {
      checkboxes = {
        [" "] = { char = "☐", hl_group = "ObsidianTodo" },
        ["x"] = { char = "✔", hl_group = "ObsidianDone" },
      },
    },
    disable_frontmatter = true,
    new_notes_location = "current_dir",
    notes_subdir = nil,
    daily_notes = {
      folder = "Daily Notes",
      template = "Daily Note Template.md",
    },
    templates = {
      folder = "Templates",
    },
  },

  config = function(_, opts)
    if vim.fn.isdirectory(vim.fn.expand(opts.workspaces[1].path)) == 0 then table.remove(opts.workspaces, 1) end

    require("obsidian").setup(opts)

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "markdown" },
      callback = function()
        vim.opt_local.conceallevel = 2
      end,
    })
  end,
}
