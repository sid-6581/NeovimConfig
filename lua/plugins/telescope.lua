return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  event = "VeryLazy",

  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-z.nvim",
    "debugloop/telescope-undo.nvim",

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },

    {
      "ahmedkhalf/project.nvim",
      event = "VeryLazy",
      opts = {
        ignore_lsp = { "null-ls" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".gitignore", "*" },
        scope_chdir = "tab",
        show_hidden = true,
        silent_chdir = true,
      },

      config = function(_, opts) require("project_nvim").setup(opts) end,
    },
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        winblend = 10,
        layout_config = {
          horizontal = {
            preview_width = 0.6,
            width = 0.9,
          },
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt_prefix = " ",
        selection_caret = " ",
        -- path_display = { "smart" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--multiline",
          "--hidden",
        },
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<F1>"] = actions.which_key,
          },
          n = {
            ["<F1>"] = actions.which_key,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--hidden", "--exclude", ".git", "--glob", "" },
        },
      },
      extensions = {
        undo = {
          use_delta = false,
        },
      },
    })

    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
    telescope.load_extension("undo")
    telescope.load_extension("z")
    telescope.load_extension("projects")
    telescope.load_extension("scope")

    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Title" })
  end,
}
