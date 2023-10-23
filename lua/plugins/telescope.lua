local yank_all_entries = function(prompt_bufnr)
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local entry_display = require("telescope.pickers.entry_display")
  local picker = action_state.get_current_picker(prompt_bufnr)
  local manager = picker.manager
  local entries = {}
  for entry in manager:iter() do
    local display, _ = entry_display.resolve(picker, entry)
    table.insert(entries, display)
  end
  actions.close(prompt_bufnr)
  vim.fn.setreg("", table.concat(entries, "\n"))
end

local yank_preview_lines = function(prompt_bufnr)
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(prompt_bufnr)
  local lines = vim.api.nvim_buf_get_lines(picker.previewer.state.bufnr, 0, -1, false)
  local text = table.concat(lines, "\n")
  actions.close(prompt_bufnr)
  vim.fn.setreg("", text)
end

return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",

  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "jvgrootveld/telescope-zoxide",
    "debugloop/telescope-undo.nvim",
    "Marskey/telescope-sg",
    "cljoly/telescope-repo.nvim",

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },

  -- stylua: ignore
  keys = {
    { mode = { "n", "i", "x" }, "<F1>", function() require("telescope.builtin").help_tags() end, desc = "Help" },
    { "<Leader>f.", function() require("telescope").extensions.file_browser.file_browser() end, desc = "Browse files" },
    { "<Leader>f/", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Current buffer fuzzy find" },
    { "<Leader>fA", function() require("telescope.builtin").ast_grep() end, desc = "ast-grep" },
    { "<Leader>fH", function() require("telescope.builtin").highlights() end, desc = "Highlights" },
    { "<Leader>fM", function() require("telescope.builtin").man_pages() end, desc = "Man pages" },
    { "<Leader>fR", function() require("telescope.builtin").registers() end, desc = "Registers" },
    { "<Leader>fa", function() require("telescope.builtin").builtin() end, desc = "All" },
    { "<Leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
    { "<Leader>fc", function() require("telescope.builtin").commands() end, desc = "Commands" },
    { "<Leader>fC", function() require("telescope.builtin").autocommands() end, desc = "Autocommands" },
    { "<Leader>ff", function() require("telescope.builtin").find_files() end, desc = "Files" },
    { "<Leader>fg", function() require("telescope.builtin").git_branches() end, desc = "Git branches" },
    { "<Leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help" },
    { "<Leader>fk", function() require("telescope.builtin").keymaps() end, desc = "Keymaps" },
    { "<Leader>fl", function() require("telescope.builtin").find_files({ cwd = require("telescope.utils").buffer_dir(), }) end, desc = "Files from current directory" },
    { "<Leader>fn", function() require("telescope").extensions.noice.noice() end, desc = "Noice" },
    { "<Leader>fo", function() require("telescope.builtin").vim_options() end, desc = "Vim options" },
    { "<Leader>fp", function() require("telescope").extensions.repo.list() end, desc = "Projects" },
    { "<Leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
    { "<Leader>fs", function() require("telescope.builtin").symbols() end, desc = "Symbols" },
    { "<Leader>ft", function() require("telescope.builtin").live_grep() end, desc = "Text" },
    { "<Leader>fu", function() require("telescope").extensions.undo.undo() end, desc = "Undo" },
    { "<Leader>fw", function() require("telescope.builtin").grep_string() end, desc = "Word" },
    { "<Leader>fz", function() require("telescope").extensions.zoxide.list() end, desc = "Zoxide" },
    { "<Leader>gb", function() require("telescope.builtin").git_branches() end, desc = "Branches" },
    { "<Leader>gc", function() require("telescope.builtin").git_commits() end, desc = "Commits" },
    { "<Leader>go", function() require("telescope.builtin").git_status() end, desc = "Status" },
    { "<Leader>lD", function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, desc = "Document diagnostics" },
    { "<Leader>lS", function() require("telescope.builtin").lsp_document_symbols() end, desc = "Document symbols" },
    { "<Leader>ld", function() require("telescope.builtin").diagnostics() end, desc = "Workspace diagnostics" },
    { "<Leader>lr", function() require("telescope.builtin").lsp_references() end, desc = "References" },
    { "<Leader>ls", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, desc = "Workspace symbols" },
  },

  opts = function()
    local actions = require("telescope.actions")

    return {
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
            ["<C-c>"] = false,
            ["<F1>"] = actions.which_key,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-y>e"] = yank_all_entries,
            ["<C-y>p"] = yank_preview_lines,
          },
          n = {
            ["<F1>"] = actions.which_key,
            ["<C-y>e"] = yank_all_entries,
            ["<C-y>p"] = yank_preview_lines,
          },
        },
      },
      pickers = {
        builtin = {
          include_extensions = true,
        },
        find_files = {
          find_command = { "fd", "--hidden", "--exclude", ".git", "--glob", "" },
        },
        keymaps = {
          filter = function(km)
            -- Hide which-key keymaps
            return not km.lhs:match("Þ$") and (not km.rhs or not km.rhs:match("which%-key"))
          end,
        },
        lsp_definitions = {
          show_line = false,
        },
        lsp_references = {
          show_line = false,
        },
      },
      extensions = {
        ast_grep = {
          command = {
            "ast-grep",
            "--json=stream",
          },
          grep_open_files = false,
          lang = nil,
        },
        repo = {
          list = {
            file_ignore_patterns = { "/%.cache/", "/%.cargo/" },
            search_dirs = (vim.fn.has("win32") == 1)
                and { "D:/Code", "~/AppData/Local/nvim-data", "~/AppData/Local/nvim" }
              or { "~" },
          },
        },
        undo = {
          use_delta = false,
        },
      },
    }
  end,

  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("ast_grep")
    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
    telescope.load_extension("repo")
    telescope.load_extension("scope")
    telescope.load_extension("undo")
    telescope.load_extension("zoxide")

    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Title" })
  end,
}
