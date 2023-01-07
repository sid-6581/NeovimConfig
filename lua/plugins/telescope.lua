return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",

  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-z.nvim",
    "debugloop/telescope-undo.nvim",
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
          "--hidden",
        },
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["jj"] = { "<Esc>", type = "command" },
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-c>"] = actions.close,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<A-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<F1>"] = actions.which_key,
          },
          n = {
            ["<Esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-c>"] = actions.close,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<A-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["?"] = actions.which_key,
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
    telescope.load_extension("undo")
    telescope.load_extension("z")
    telescope.load_extension("projects")

    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Title" })
  end,
}
