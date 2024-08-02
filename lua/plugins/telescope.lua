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

local cursor_theme = function(opts)
  return require("telescope.themes").get_cursor(
    vim.tbl_deep_extend("force", { layout_config = { height = 20, width = 80 } }, opts)
  )
end

return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",

  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "fdschmidt93/telescope-egrepify.nvim",
    "jvgrootveld/telescope-zoxide",
    "debugloop/telescope-undo.nvim",
    "Marskey/telescope-sg",

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },

  keys = {
    { "<F1>", function() require("telescope.builtin").help_tags() end, mode = { "n", "i", "v", "x", "o", "t" }, desc = "Help [telescope]" },
    { "<F3>", function() require("telescope.builtin").keymaps() end, mode = { "n", "i", "v", "x", "o", "t" }, desc = "Keymaps [telescope]" },
    { "<Leader>f.", function() require("telescope").extensions.file_browser.file_browser() end, desc = "Browse files [telescope]" },
    { "<Leader>f/", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Current buffer fuzzy find [telescope]" },
    { "<Leader>fA", function() require("telescope").extensions.ast_grep.ast_grep() end, desc = "ast-grep [telescope]" },
    { "<Leader>fC", function() require("telescope.builtin").autocommands() end, desc = "Autocommands [telescope]" },
    { "<Leader>fh", function() require("telescope.builtin").highlights() end, desc = "Highlights [telescope]" },
    { "<Leader>fR", function() require("telescope.builtin").registers() end, desc = "Registers [telescope]" },
    { "<Leader>fa", function() require("telescope.builtin").builtin() end, desc = "All [telescope]" },
    { "<Leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers [telescope]" },
    { "<Leader>fc", function() require("telescope.builtin").commands() end, desc = "Commands [telescope]" },
    { "<Leader>fd", function() require("telescope.builtin").lsp_definitions() end, desc = "LSP definitions [telescope]" },
    { "<Leader>ff", function() require("telescope.builtin").find_files() end, desc = "Files [telescope]" },
    {
      "<Leader>fF",
      function()
        require("telescope.builtin").find_files({
          find_command = {
            "fd",
            "--hidden",
            "--no-ignore",
          },
        })
      end,
      desc = "Files (all)",
    },
    { "<Leader>fH", function() require("telescope.builtin").help_tags() end, desc = "Help [telescope]" },
    { "<Leader>fk", function() require("telescope.builtin").keymaps() end, desc = "Keymaps [telescope]" },
    {
      "<Leader>fl",
      function() require("telescope.builtin").find_files({ cwd = require("telescope.utils").buffer_dir() }) end,
      desc = "Files from current directory [telescope]",
    },
    { "<Leader>fo", function() require("telescope.builtin").vim_options() end, desc = "Vim options [telescope]" },
    { "<Leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Recent files [telescope]" },
    {
      "<Leader>fs",
      function() require("telescope.builtin").symbols(cursor_theme({ sources = { "emoji", "gitmoji", "nerd" } })) end,
      desc = "Symbols [telescope]",
    },
    { "<Leader>ft", function() require("telescope").extensions.egrepify.egrepify() end, desc = "Text [telescope]" },
    {
      "<Leader>fT",
      function()
        require("telescope").extensions.egrepify.egrepify({
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
            "--no-ignore",
          },
        })
      end,
      desc = "Text (all files) [telescope]",
    },
    { "<Leader>fu", function() require("telescope").extensions.undo.undo() end, desc = "Undo [telescope]" },
    { "<Leader>fw", function() require("telescope.builtin").grep_string() end, desc = "Word [telescope]" },
    { "<Leader>fy", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "Yank history [telescope]" },
    { "<Leader>fz", function() require("telescope").extensions.zoxide.list() end, desc = "Zoxide [telescope]" },
    { "<Leader>gS", function() require("telescope.builtin").git_stash() end, desc = "Git stash [telescope]" },
    { "<Leader>gb", function() require("telescope.builtin").git_branches() end, desc = "Branches [telescope]" },
    { "<Leader>gc", function() require("telescope.builtin").git_commits() end, desc = "Commits [telescope]" },
    { "<Leader>gC", function() require("telescope.builtin").git_bcommits() end, desc = "Buffer commits [telescope]" },
    { "<Leader>gs", function() require("telescope.builtin").git_status() end, desc = "Status [telescope]" },

    -- Select directories containing .git in the specified search_dirs.
    -- The default select action will change the default directory and open oil.
    {
      "<Leader>fp",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.env.HOME,
          find_command = {
            "fd",
            "--prune",
            "--hidden",
            "--case-sensitive",
            "--absolute-path",
            "--no-ignore",
            "-td",
            "-x",
            "echo",
            "{//}",
            ";",
          },

          file_ignore_patterns = { "%.cache", "%.cargo" },

          attach_mappings = function(prompt_bufnr, _map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local dir = action_state.get_selected_entry()[1]
              vim.cmd.lcd(dir)
              require("neo-tree.command").execute({ action = "show", dir = dir })
            end)

            return true
          end,

          search_file = "^\\.git$",

          search_dirs = (vim.fn.has("win32") == 1)
            and { "D:/Code", vim.fn.expand("~/.local/share/nvim-data") }
            or { vim.fn.expand("~/") },
        })
      end,
      desc = "Projects [telescope]",
    },
  },

  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        winblend = 0,
        layout_config = {
          prompt_position = "top",
          horizontal = {
            preview_width = 0.6,
            height = 0.8,
            width = 0.9,
          },
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt_prefix = " ",
        sorting_strategy = "ascending",
        selection_caret = " ",
        path_display = { "truncate" },
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
            ["<Esc>"] = { actions.close, type = "action", opts = { desc = "Close" } },
            ["<C-C>"] = false,
            ["<F1>"] = { actions.which_key, type = "action", opts = { desc = "Help" } },
            ["<C-N>"] = { actions.cycle_history_next, type = "action", opts = { desc = "Next history" } },
            ["<C-P>"] = { actions.cycle_history_prev, type = "action", opts = { desc = "Previous history" } },
            ["<C-J>"] = { actions.move_selection_next, type = "action", opts = { desc = "Next selection" } },
            ["<C-K>"] = { actions.move_selection_previous, type = "action", opts = { desc = "Previous selection" } },
            ["<C-Y>e"] = { yank_all_entries, type = "action", opts = { desc = "Yank all entries" } },
            ["<C-Y>p"] = { yank_preview_lines, type = "action", opts = { desc = "Yank preview lines" } },
            ["<C-X>"] = false,
            ["<C-S>"] = { actions.select_horizontal, type = "action", opts = { desc = "Open in horizontal split" } },
            ["<C-V>"] = { actions.select_vertical, type = "action", opts = { desc = "Open in vertical split" } },
            ["<C-T>"] = { actions.select_tab, type = "action", opts = { desc = "Open in new tab" } },
            ["<CR>"] = { actions.select_default, type = "action", opts = { desc = "Select" } },
          },
          n = {
            ["<F1>"] = { actions.which_key, type = "action", opts = { desc = "Help" } },
            ["<C-Y>e"] = { yank_all_entries, type = "action", opts = { desc = "Yank all entries" } },
            ["<C-Y>p"] = { yank_preview_lines, type = "action", opts = { desc = "Yank preview lines" } },
          },
        },
      },

      pickers = {
        builtin = {
          include_extensions = true,
        },
        find_files = {
          find_command = {
            "fd",
            "--hidden",
            "--exclude",
            ".git",
            "--exclude",
            "node_modules",
          },
        },
        lsp_references = {
          include_declaration = false,
          include_current_line = false,
        },
        keymaps = {
          filter = function(km)
            -- Hide which-key keymaps
            return not km.lhs:match("Þ$") and (not km.rhs or not km.rhs:match("which%-key"))
          end,
          show_plug = true,
        },
        symbols = cursor_theme({}),
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
        egrepify = {
          title = false,
        },
        undo = {
          use_delta = false,
        },
      },
    }
  end,

  config = function(_, opts)
    local telescope = require("telescope")
    local utils = require("telescope.utils")

    local transform_path = utils.transform_path
    --- @diagnostic disable-next-line: duplicate-set-field
    utils.transform_path = function(opts2, path)
      path = require("util").normalize_path(path)
      return transform_path(opts2, path)
    end

    local is_uri = utils.is_uri
    --- @diagnostic disable-next-line: duplicate-set-field
    utils.is_uri = function(filename)
      if filename:sub(2, 2) == ":" then
        return false
      end

      return is_uri(filename)
    end

    telescope.setup(opts)
    telescope.load_extension("ast_grep")
    telescope.load_extension("egrepify")
    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
    telescope.load_extension("scope")
    telescope.load_extension("undo")
    telescope.load_extension("zoxide")

    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Title" })

    local colors = require("util.colors")
    local hl_cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine" })
    colors.mod_hl("TelescopeSelection", { bg = hl_cursorline.bg })
  end,
}
